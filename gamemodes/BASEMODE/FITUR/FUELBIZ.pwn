#define MAX_FUELBIZ            (200)

enum F_FUEL
{
	FE_ID,
	Float:FE_POS_X,
	Float:FE_POS_Y,
	Float:FE_POS_Z,
	rcPickup,
	Text3D:rcText,
};
new FUELBIZDATA[MAX_FUELBIZ][F_FUEL];
new Iterator:FuelBiz<MAX_FUELBIZ>;

epublic: LoadFuelBizz()
{
	new string[1248];
	new rows;
	rows = cache_num_rows();

	if(rows)
  	{
		for(new i; i < rows; i++)
		{
		    cache_get_value_name_int(i, "id", FUELBIZDATA[i][FE_ID]);
			cache_get_value_name_float(i, "point_x", FUELBIZDATA[i][FE_POS_X]);
			cache_get_value_name_float(i, "point_y", FUELBIZDATA[i][FE_POS_Y]);
			cache_get_value_name_float(i, "point_z", FUELBIZDATA[i][FE_POS_Z]);

			Iter_Add(FuelBiz, i);

			FUELBIZDATA[i][rcPickup] = CreateDynamicPickup(1650, 23, FUELBIZDATA[i][FE_POS_X], FUELBIZDATA[i][FE_POS_Y], FUELBIZDATA[i][FE_POS_Z], 0);
			format(string, sizeof(string), "FUEL BIZ ID [%d] \n TEKAN [Y]\n >> UNTUK MEMBELI BENGSING", i);
			FUELBIZDATA[i][rcText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, FUELBIZDATA[i][FE_POS_X], FUELBIZDATA[i][FE_POS_Y], FUELBIZDATA[i][FE_POS_Z], 4.0);
	    }
	}
	return 1;
}

stock UpdateFuelDyamic(i)
{
	DestroyDynamic3DTextLabel(FUELBIZDATA[i][rcText]);
	DestroyDynamicPickup(FUELBIZDATA[i][rcPickup]);

	new string[2048];
	FUELBIZDATA[i][rcPickup] = CreateDynamicPickup(1650, 23, FUELBIZDATA[i][FE_POS_X], FUELBIZDATA[i][FE_POS_Y], FUELBIZDATA[i][FE_POS_Z], 0);
	format(string, sizeof(string), "FUEL BIZ ID [%d] \n TEKAN [Y]\n >> UNTUK MEMBELI BENGSING", i);
	FUELBIZDATA[i][rcText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, FUELBIZDATA[i][FE_POS_X], FUELBIZDATA[i][FE_POS_Y], FUELBIZDATA[i][FE_POS_Z], 4.0);
}

CMD:createfuel(playerid, params[])
{
	if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;

	new idx = Iter_Free(FuelBiz);

	new Cache:result;

 	new Float:X, Float:Y, Float:Z;
    GetPlayerPos(playerid, X, Y, Z);
    FUELBIZDATA[idx][FE_POS_X] = X;
    FUELBIZDATA[idx][FE_POS_Y] = Y;
	FUELBIZDATA[idx][FE_POS_Z] = Z;

	new fmt_text[1280];
	format
	(
		fmt_text, sizeof fmt_text,
		"INSERT INTO fuelbiz \
		(point_x, point_y, point_z)\
		VALUES ('%f', '%f', '%f')",
		X,
		Y,
		Z
	);

	result = mysql_query(mMysql, fmt_text, true);

	FUELBIZDATA[idx][FE_ID] = cache_insert_id();

	cache_delete(result);

    Iter_Add(FuelBiz, idx);

	UpdateFuelDyamic(idx);
	format(String, sizeof(String), "ADMINFO: %s has created FuelBiz ID %d.", GN(playerid), idx);
	SendAdminMessage(COLOR_RED, String);
	return 1;
}

CMD:removefuel(playerid, params[])
{
    if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;

    new string[1280];

    extract params -> new FuelBiz_id; else return ShowInfo(playerid, "/removefuel [FuelBiz id]");

    if(FuelBiz_id > MAX_FUELBIZ) return ShowError(playerid, "Wrong FuelBiz ID");
    if(FuelBiz_id < 0) return ShowError(playerid, "Wrong FuelBiz ID");

	new query[1280];
	format(string, sizeof(string), "FuelBiz deleted with ID %d.", FuelBiz_id);
	SendClientMessageEx(playerid, COLOR_GRAD1, string);
	Iter_Remove(FuelBiz, FuelBiz_id);
	mysql_format(mMysql, query, sizeof(query), "DELETE FROM fuelbiz WHERE id=%d", FuelBiz_id);
	mysql_tquery(mMysql, query);
	
	UpdateFuelDyamic(FuelBiz_id);
	DestroyDynamic3DTextLabel(FUELBIZDATA[FuelBiz_id][rcText]);
	DestroyDynamicPickup(FUELBIZDATA[FuelBiz_id][rcPickup]);
    return 1;
}
