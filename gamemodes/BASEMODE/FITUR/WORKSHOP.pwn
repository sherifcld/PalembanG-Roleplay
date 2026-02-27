#define MAX_WORKSHOP 100
#define MAX_WORKSHOP_EMPLOYEE 9
#define MAX_WORKSHOP_INT 100000

enum E_WORKSHOP
{
    wID,
    wName[24],
    wOwner[MAX_PLAYER_NAME + 1],
    wOwnerID,
    wComp,
    wMat,
    wMoney,
    Text3D:wText,
    wPickup,
    Float:wX,
    Float:wY,
    Float:wZ,
    wStatus,
    wPrice
};
new wsData[MAX_WORKSHOP][E_WORKSHOP],
    wsEmploy[MAX_WORKSHOP][9][MAX_PLAYER_NAME + 1],
    Iterator:Workshop<MAX_WORKSHOP>;

new dutyws[MAX_PLAYERS];
Workshop_Refresh(id)
{
    if(id > -1)
    {
        if(IsValidDynamic3DTextLabel(wsData[id][wText]))
            DestroyDynamic3DTextLabel(wsData[id][wText]), wsData[id][wText] = Text3D: INVALID_3DTEXT_ID;

        if(IsValidDynamicPickup(wsData[id][wPickup]))
            DestroyDynamicPickup(wsData[id][wPickup]), wsData[id][wPickup] = -1;

        new str[316], stats[64];
        if(wsData[id][wStatus] == 1)
        {
            stats = "{7fff00}OPEN{ffffff}";
        }
        else
        {
            stats = "{ff0000}CLOSED{ffffff}";
        }

        format(str, sizeof str,"[Workshop ID:%d]\n{ffffff}Workshop Price: {7fff00}%s{ffffff}\n{ffffff}Type '/buy' to buy this Workshop", id, FormatMoney(wsData[id][wPrice]));

        if(strcmp(wsData[id][wOwner], "-", true))
            format(str, sizeof str,"[Workshop ID:%d]\n{ffffff}Workshop Name: %s\n{ffffff}Workshop Owner: %s\n{ffffff}STATUS: %s{ffffff}\n/dutyws >> Untuk onduty dan offduty workshop", id, wsData[id][wName], wsData[id][wOwner], stats);

        wsData[id][wText] = CreateDynamic3DTextLabel(str, GUS_COLOR, wsData[id][wX], wsData[id][wY], wsData[id][wZ]+0.5, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1, 8.0);
        wsData[id][wPickup] = CreateDynamicPickup(1239, 23, wsData[id][wX], wsData[id][wY], wsData[id][wZ]+0.2, -1);
    }
}

Workshop_Save(id)
{
    new query[2248];
    format(query, sizeof query,"UPDATE workshop SET owner='%s', name='%s', component=%d, material=%d, money=%d, posx='%f', posy='%f', posz='%f', status=%d, price=%d",
        wsData[id][wOwner],
        wsData[id][wName],
        wsData[id][wComp],
        wsData[id][wMat],
        wsData[id][wMoney],
        wsData[id][wX],
        wsData[id][wY],
        wsData[id][wZ],
        wsData[id][wStatus],
        wsData[id][wPrice]);
    for(new z = 0; z < MAX_WORKSHOP_EMPLOYEE; z++)
    {
        format(query, sizeof query,"%s, employe%d='%s'", query, z, wsEmploy[id][z]);
    }
    format(query, sizeof query,"%s WHERE id = %d", query, id);
    return mysql_tquery(mMysql, query);
}

Workshop_Reset(id)
{
    format(wsData[id][wOwner], MAX_PLAYER_NAME, "-");
    format(wsEmploy[id][0], MAX_PLAYER_NAME, "-");
    format(wsEmploy[id][1], MAX_PLAYER_NAME, "-");
    format(wsEmploy[id][2], MAX_PLAYER_NAME, "-");
    wsData[id][wComp] = 0;
    wsData[id][wMat] = 0;
    wsData[id][wMoney] = 0;
    for(new z = 0; z < MAX_WORKSHOP_EMPLOYEE; z++)
    {
        format(wsEmploy[id][z], MAX_PLAYER_NAME, "-");
    }
    Workshop_Refresh(id);
}

IsWorkshopEmploye(playerid, id)
{
    if(!strcmp(wsEmploy[id][0], PlayerInfo[playerid][pName], true)) return 1;
    if(!strcmp(wsEmploy[id][1], PlayerInfo[playerid][pName], true)) return 1;
    if(!strcmp(wsEmploy[id][2], PlayerInfo[playerid][pName], true)) return 1;
    if(!strcmp(wsEmploy[id][3], PlayerInfo[playerid][pName], true)) return 1;
    if(!strcmp(wsEmploy[id][4], PlayerInfo[playerid][pName], true)) return 1;
    if(!strcmp(wsEmploy[id][5], PlayerInfo[playerid][pName], true)) return 1;
    if(!strcmp(wsEmploy[id][6], PlayerInfo[playerid][pName], true)) return 1;
    if(!strcmp(wsEmploy[id][7], PlayerInfo[playerid][pName], true)) return 1;
    if(!strcmp(wsEmploy[id][8], PlayerInfo[playerid][pName], true)) return 1;
    return 0;
}

IsWorkshopOwner(playerid, id)
{
    if(!strcmp(wsData[id][wOwner], PlayerInfo[playerid][pName], true))
        return 1;

    return 0;
}

epublic: LoadWorkshop()
{
    static wid;

	new rows = cache_num_rows(), owner[128], name[128];
 	if(rows)
  	{
		for(new i; i < rows; i++)
		{
			cache_get_value_name_int(i, "id", wid);
			cache_get_value_name(i, "owner", owner);
			format(wsData[wid][wOwner], 128, owner);
			cache_get_value_name(i, "name", name);
			format(wsData[wid][wName], 128, name);
			cache_get_value_name_int(i, "price", wsData[wid][wPrice]);
			cache_get_value_name_float(i, "posx", wsData[wid][wX]);
			cache_get_value_name_float(i, "posy", wsData[wid][wY]);
			cache_get_value_name_float(i, "posz", wsData[wid][wZ]);
			cache_get_value_name_int(i, "component", wsData[wid][wComp]);
			cache_get_value_name_int(i, "material", wsData[wid][wMat]);
            cache_get_value_name_int(i, "money", wsData[wid][wMoney]);
            for(new z = 0; z < MAX_WORKSHOP_EMPLOYEE; z++)
            {
                new str[64];
                format(str, sizeof str,"employe%d", z);
                cache_get_value_name(i, str, wsEmploy[wid][z]);
            }
			Workshop_Refresh(wid);
			Iter_Add(Workshop, wid);
		}
		printf("[WORKSHOP] Number of Loaded: %d.", rows);
	}
}

/*GetAnyWorkshop()
{
	new tmpcount;
	foreach(new id : Workshop)
	{
     	tmpcount++;
	}
	return tmpcount;
}*/

ReturnWorkshopID(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_WORKSHOP) return -1;
	foreach(new id : Workshop)
	{
        tmpcount++;
        if(tmpcount == slot)
        {
            return id;
        }
	}
	return -1;
}

CMD:wsmenu(playerid, params[])
{
    foreach(new id : Workshop)
	{
        if(IsPlayerInRangeOfPoint(playerid, 5.0, wsData[id][wX], wsData[id][wY], wsData[id][wZ]))
        {
            if(!IsWorkshopOwner(playerid, id) && !IsWorkshopEmploye(playerid, id))
                return ShowError(playerid, "You're not the Owner or Employee of this Workshop");

            ShowWorkshopMenu(playerid, id);
        }
    }
    return 1;
}

ShowWorkshopMenu(playerid, id)
{
    PlayerInfo[playerid][pMenuType] = 0;
    PlayerInfo[playerid][pInWs] = id;

    new str[256], vstr[64];
    format(vstr, sizeof vstr,"Workshop (%s) Menu", wsData[id][wName]);
    format(str, sizeof str,"Set Workshop Name\nEmploye Menu\nComponent\t(%d/%d)\nMaterial\t(%d/%d)\nMoney\t({7fff00}%s{ffffff})",
        wsData[id][wComp],
        MAX_WORKSHOP_INT,
        wsData[id][wMat],
        MAX_WORKSHOP_INT,
        FormatMoney(wsData[id][wMoney]));
    ShowPlayerDialog(playerid, WS_MENU, DIALOG_STYLE_LIST, vstr, str, "Select", "Cancel");
    return 1;
}

CMD:createworkshop(playerid, params[])
{
	new query[512];
	new wid = Iter_Free(Workshop);
	if(wid == -1) return ShowError(playerid, "You cant create more workshop!");
	new price;
	if(sscanf(params, "d", price)) return ShowInfo(playerid, "/createworkshop [price]");
	new totalcash[25];
	format(totalcash, sizeof totalcash,"%d00",price);
	price = strval(totalcash);
	format(wsData[wid][wOwner], MAX_PLAYER_NAME, "-");
    format(wsEmploy[wid][0], MAX_PLAYER_NAME, "-");
    format(wsEmploy[wid][1], MAX_PLAYER_NAME, "-");
    format(wsEmploy[wid][2], MAX_PLAYER_NAME, "-");
    format(wsData[wid][wName], 24, "-");
	GetPlayerPos(playerid, wsData[wid][wX], wsData[wid][wY], wsData[wid][wZ]);
	wsData[wid][wPrice] = price;
	wsData[wid][wStatus] = 0;

    Workshop_Refresh(wid);
	Iter_Add(Workshop, wid);

	mysql_format(mMysql, query, sizeof(query), "INSERT INTO workshop SET id=%d, owner='%s', price=%d, posx='%f', posy='%f', posz='%f', name='%s'", wid, wsData[wid][wOwner], wsData[wid][wPrice], wsData[wid][wX], wsData[wid][wY], wsData[wid][wZ], wsData[wid][wName]);
	mysql_tquery(mMysql, query, "OnWorkshopCreated", "i", wid);
    Info(playerid, "Created Workshop ID:%d", wid);
	return 1;
}

epublic: OnWorkshopCreated(wid)
{
	Workshop_Save(wid);
    Workshop_Refresh(wid);
	return 1;
}

CMD:gotoworkshop(playerid, params[])
{
	new wid;
	if(sscanf(params, "d", wid))
		return ShowInfo(playerid, "/gotoworkshop [id]");
	if(!Iter_Contains(Workshop, wid)) return ShowError(playerid, "The Workshop you specified ID of doesn't exist.");
	SetPlayerPos(playerid, wsData[wid][wX], wsData[wid][wY], wsData[wid][wZ]);
    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);
	Info(playerid, "You has teleport to Workshop id %d", wid);
	return 1;
}

CMD:editworkshop(playerid, params[])
{
    static
        wid,
        type[24],
        string[128];

    if(sscanf(params, "ds[24]S()[128]", wid, type, string))
    {
        ShowInfo(playerid, "/editworkshop [id] [name]");
        SendClientMessage(playerid, COLOR_YELLOW, "[NAMES]:{FFFFFF} location, status, owner, price, money, comp, mat");
        return 1;
    }
    if((wid < 0 || wid >= MAX_WORKSHOP))
        return ShowError(playerid, "You have specified an invalid ID.");
	if(!Iter_Contains(Workshop, wid)) return ShowError(playerid, "The Workshop you specified ID of doesn't exist.");

    if(!strcmp(type, "location", true))
    {
		GetPlayerPos(playerid, wsData[wid][wX], wsData[wid][wY], wsData[wid][wZ]);
        Workshop_Save(wid);
		Workshop_Refresh(wid);
    }
    else if(!strcmp(type, "status", true))
    {
        new locked;

        if(sscanf(string, "d", locked))
            return ShowInfo(playerid, "/editWorkshop [id] [locked] [0/1]");

        if(locked < 0 || locked > 1)
            return ShowError(playerid, "You must specify at least 0 or 1.");

        wsData[wid][wStatus] = locked;
        Workshop_Save(wid);
		Workshop_Refresh(wid);
    }
    else if(!strcmp(type, "price", true))
    {
        new price;

        if(sscanf(string, "d", price))
            return ShowInfo(playerid, "/editWorkshop [id] [Price] [Amount]");

        wsData[wid][wPrice] = price;

        Workshop_Save(wid);
		Workshop_Refresh(wid);
    }
	else if(!strcmp(type, "money", true))
    {
        new money;

        if(sscanf(string, "d", money))
            return ShowInfo(playerid, "/editWorkshop [id] [money] [Ammount]");

        wsData[wid][wMoney] = money;
        Workshop_Save(wid);
		Workshop_Refresh(wid);
    }
	else if(!strcmp(type, "comp", true))
    {
        new amount;

        if(sscanf(string, "d", amount))
            return ShowInfo(playerid, "/editWorkshop [id] [Comp] [Ammount]");

        wsData[wid][wComp] = amount;
        Workshop_Save(wid);
		Workshop_Refresh(wid);
    }
    else if(!strcmp(type, "mat", true))
    {
        new amount;

        if(sscanf(string, "d", amount))
            return ShowInfo(playerid, "/editWorkshop [id] [mat] [Ammount]");

        wsData[wid][wMat] = amount;
        Workshop_Save(wid);
		Workshop_Refresh(wid);
    }
    else if(!strcmp(type, "owner", true))
    {
        new owners[MAX_PLAYER_NAME];

        if(sscanf(string, "s[24]", owners))
            return ShowInfo(playerid, "/editWorkshop [id] [owner] [player name] (use '-' to no owner)");

        format(wsData[wid][wOwner], MAX_PLAYER_NAME, owners);

        Workshop_Save(wid);
		Workshop_Refresh(wid);
    }
    else if(!strcmp(type, "reset", true))
    {
        Workshop_Reset(wid);
		Workshop_Save(wid);
		Workshop_Refresh(wid);
    }
	else if(!strcmp(type, "delete", true))
    {
		Workshop_Reset(wid);
        Workshop_Refresh(wid);
		DestroyDynamic3DTextLabel(wsData[wid][wText]);
        DestroyDynamicPickup(wsData[wid][wPickup]);

		wsData[wid][wX] = 0;
		wsData[wid][wY] = 0;
		wsData[wid][wZ] = 0;
		wsData[wid][wPrice] = 0;
		wsData[wid][wText] = Text3D: INVALID_3DTEXT_ID;
		wsData[wid][wPickup] = -1;

		Iter_Remove(Workshop, wid);
		new query[128];
		mysql_format(mMysql, query, sizeof(query), "DELETE FROM Workshop WHERE ID=%d", wid);
		mysql_tquery(mMysql, query);
	}
    return 1;
}

CMD:lockworkshop(playerid, params[])
{
	foreach(new wid : Workshop)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.5, wsData[wid][wX], wsData[wid][wY], wsData[wid][wZ]))
		{
			if(!IsWorkshopOwner(playerid, wid) && !IsWorkshopEmploye(playerid, wid)) return ShowError(playerid, "Kamu bukan pengurus Workshop ini.");
			if(!wsData[wid][wStatus])
			{
				wsData[wid][wStatus] = 1;
				Workshop_Save(wid);

				ShowInfo(playerid, "Workshop anda berhasil ~g~Dibuka!");
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			}
			else
			{
				wsData[wid][wStatus] = 0;
				Workshop_Save(wid);

				ShowInfo(playerid,"Workshop anda berhasil ~r~Ditutup");
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			}
            Workshop_Refresh(wid);
		}
	}
	return 1;
}

CMD:dutyws(playerid, params[])
{
    foreach(new wid : Workshop)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.5, wsData[wid][wX], wsData[wid][wY], wsData[wid][wZ]))
        {
            if(!IsWorkshopOwner(playerid, wid) && !IsWorkshopEmploye(playerid, wid)) return ShowError(playerid, "Kamu bukan pengurus Workshop ini.");
            if(!dutyws[playerid])
            {
                format(format_string, sizeof(format_string), "NAME : {00ff00} %s {FFFFFF} ID : {ffff00} %d {FFFFFF} TELAH {00ff00} ONDUTY {FFFFFF} WORKSHOP KOTA INI", Name(playerid), playerid);
                SendClientMessageToAll(-1, format_string);

                dutyws[playerid] = 1;

                ShowInfo(playerid, "Workshop anda berhasil");
                PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
            }
            else
            {
                format(format_string, sizeof(format_string), "NAME : {00ff00} %s {FFFFFF} ID : {ffff00} %d {FFFFFF} TELAH {ff0015} OFFDUTY {FFFFFF} WORKSHOP KOTA INI", Name(playerid), playerid);
                SendClientMessageToAll(-1, format_string);
                dutyws[playerid] = 0;

                ShowInfo(playerid,"Workshop anda berhasil");
                PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
            }
        }
    }
    return 1;
}