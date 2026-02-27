#define MAX_RENTBOAT            (200)

enum E_BOATC
{
	BT_ID,
	Float:BT_POS_X,
	Float:BT_POS_Y,
	Float:BT_POS_Z,
	rcPickup,
	Text3D:rcText,
};
new BOATDATA[MAX_RENTBOAT][E_BOATC];
new Iterator:RentBoat<MAX_RENTBOAT>;

epublic: LoadBoatRent()
{
	new string[255];
	new rows;
	rows = cache_num_rows();

	if(rows)
  	{
		for(new i; i < rows; i++)
		{
		    cache_get_value_name_int(i, "id", BOATDATA[i][BT_ID]);
			cache_get_value_name_float(i, "point_x", BOATDATA[i][BT_POS_X]);
			cache_get_value_name_float(i, "point_y", BOATDATA[i][BT_POS_Y]);
			cache_get_value_name_float(i, "point_z", BOATDATA[i][BT_POS_Z]);

			Iter_Add(RentBoat, i);

			BOATDATA[i][rcPickup] = CreateDynamicPickup(19134, 23, BOATDATA[i][BT_POS_X], BOATDATA[i][BT_POS_Y], BOATDATA[i][BT_POS_Z], 0);
			format(string, sizeof(string), "PEYEWAHAN BOAT \n ID [%d]\n TEKAN [Y] \n >> UNTUK MEYEWA KENDARAAN", i);
			BOATDATA[i][rcText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, BOATDATA[i][BT_POS_X], BOATDATA[i][BT_POS_Y], BOATDATA[i][BT_POS_Z], 4.0);
	    }
	}
	return 1;
}

stock UpdateBoatDynamic(i)
{
	DestroyDynamic3DTextLabel(BOATDATA[i][rcText]);
	DestroyDynamicPickup(BOATDATA[i][rcPickup]);

	new string[2048];
	BOATDATA[i][rcPickup] = CreateDynamicPickup(19134, 23, BOATDATA[i][BT_POS_X], BOATDATA[i][BT_POS_Y], BOATDATA[i][BT_POS_Z], 0);
	format(string, sizeof(string), "PEYEWAHAN BOAT \n ID [%d]\n TEKAN [Y] \n >> UNTUK MEYEWA KENDARAAN", i);
	BOATDATA[i][rcText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, BOATDATA[i][BT_POS_X], BOATDATA[i][BT_POS_Y], BOATDATA[i][BT_POS_Z], 4.0);
}

CMD:createrentboat(playerid, params[])
{
	if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;

	new idx = Iter_Free(RentBoat);

	new Cache:result;

 	new Float:X, Float:Y, Float:Z;
    GetPlayerPos(playerid, X, Y, Z);
    BOATDATA[idx][BT_POS_X] = X;
    BOATDATA[idx][BT_POS_Y] = Y;
	BOATDATA[idx][BT_POS_Z] = Z;

	new fmt_text[1280];
	format
	(
		fmt_text, sizeof fmt_text,
		"INSERT INTO boatrent \
		(point_x, point_y, point_z)\
		VALUES ('%f', '%f', '%f')",
		X,
		Y,
		Z
	);

	result = mysql_query(mMysql, fmt_text, true);

	BOATDATA[idx][BT_ID] = cache_insert_id();

	cache_delete(result);

    Iter_Add(RentBoat, idx);

	UpdateBoatDynamic(idx);
	format(String, sizeof(String), "ADMINFO: %s has created BoatRent ID %d.", GN(playerid), idx);
	SendAdminMessage(COLOR_RED, String);
	return 1;
}

CMD:removerentboat(playerid, params[])
{
    if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;

    new string[1280];

    extract params -> new RentBoat_id; else return ShowInfo(playerid, "/removerentboat [id]");

    if(RentBoat_id > MAX_RENTBOAT) return ShowError(playerid, "Wrong ID");
    if(RentBoat_id < 0) return ShowError(playerid, "Wrong ID");

	new query[1280];
	format(string, sizeof(string), "BoatRent deleted with ID %d.", RentBoat_id);
	SendClientMessageEx(playerid, COLOR_GRAD1, string);
	Iter_Remove(RentBoat, RentBoat_id);
	mysql_format(mMysql, query, sizeof(query), "DELETE FROM boatrent WHERE id=%d", RentBoat_id);
	mysql_tquery(mMysql, query);

	UpdateBoatDynamic(RentBoat_id);
	DestroyDynamic3DTextLabel(BOATDATA[RentBoat_id][rcText]);
	DestroyDynamicPickup(BOATDATA[RentBoat_id][rcPickup]);
    return 1;
}
