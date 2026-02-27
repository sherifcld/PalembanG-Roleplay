#define MAX_RENTCAR            (200)

enum inforc
{
	RC_ID,
	Float:RC_POS_X,
	Float:RC_POS_Y,
	Float:RC_POS_Z,
	rcPickup,
	Text3D:rcText,
};
new RentCarData[MAX_RENTCAR][inforc];
new Iterator:RentCar<MAX_RENTCAR>;

epublic: LoadRentCarData()
{
	new string[255];
	new rows;
	rows = cache_num_rows();

	if(rows)
  	{
		for(new i; i < rows; i++)
		{
		    cache_get_value_name_int(i, "id", RentCarData[i][RC_ID]);
			cache_get_value_name_float(i, "point_x", RentCarData[i][RC_POS_X]);
			cache_get_value_name_float(i, "point_y", RentCarData[i][RC_POS_Y]);
			cache_get_value_name_float(i, "point_z", RentCarData[i][RC_POS_Z]);

			Iter_Add(RentCar, i);

			RentCarData[i][rcPickup] = CreateDynamicPickup(19134, 23, RentCarData[i][RC_POS_X], RentCarData[i][RC_POS_Y], RentCarData[i][RC_POS_Z], 0);
			format(string, sizeof(string), "PEYEWAHAN KENDARAAN \n ID [%d]\n TEKAN [Y] \n >> UNTUK MEYEWA KENDARAAN", i);
			RentCarData[i][rcText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, RentCarData[i][RC_POS_X], RentCarData[i][RC_POS_Y], RentCarData[i][RC_POS_Z], 4.0);
	    }
	}
	return 1;
}

stock UpdateRentDynamic(i)
{
	DestroyDynamic3DTextLabel(RentCarData[i][rcText]);
	DestroyDynamicPickup(RentCarData[i][rcPickup]);

	new string[2048];
	RentCarData[i][rcPickup] = CreateDynamicPickup(19134, 23, RentCarData[i][RC_POS_X], RentCarData[i][RC_POS_Y], RentCarData[i][RC_POS_Z], 0);
	format(string, sizeof(string), "PEYEWAHAN KENDARAAN \n ID [%d]\n TEKAN [Y] \n >> UNTUK MEYEWA KENDARAAN", i);
	RentCarData[i][rcText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, RentCarData[i][RC_POS_X], RentCarData[i][RC_POS_Y], RentCarData[i][RC_POS_Z], 4.0);
}

CMD:createrent(playerid, params[])
{
	if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;

	new idx = Iter_Free(RentCar);

	new Cache:result;

 	new Float:X, Float:Y, Float:Z;
    GetPlayerPos(playerid, X, Y, Z);
    RentCarData[idx][RC_POS_X] = X;
    RentCarData[idx][RC_POS_Y] = Y;
	RentCarData[idx][RC_POS_Z] = Z;

	new fmt_text[1280];
	format
	(
		fmt_text, sizeof fmt_text,
		"INSERT INTO rentcar \
		(point_x, point_y, point_z)\
		VALUES ('%f', '%f', '%f')",
		X,
		Y,
		Z
	);

	result = mysql_query(mMysql, fmt_text, true);

	RentCarData[idx][RC_ID] = cache_insert_id();

	cache_delete(result);

    Iter_Add(RentCar, idx);

	UpdateRentDynamic(idx);
	format(String, sizeof(String), "ADMINFO: %s has created RentCar ID %d.", GN(playerid), idx);
	SendAdminMessage(COLOR_RED, String);
	return 1;
}

CMD:removerent(playerid, params[])
{
    if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;

    new string[1280];

    extract params -> new RentCar_id; else return ShowInfo(playerid, "/removerent [RentCar id]");

    if(RentCar_id > MAX_RENTCAR) return ShowError(playerid, "Wrong RentCar ID");
    if(RentCar_id < 0) return ShowError(playerid, "Wrong RentCar ID");

	new query[1280];
	format(string, sizeof(string), "RentCar deleted with ID %d.", RentCar_id);
	SendClientMessageEx(playerid, COLOR_GRAD1, string);
	Iter_Remove(RentCar, RentCar_id);
	mysql_format(mMysql, query, sizeof(query), "DELETE FROM rentcar WHERE id=%d", RentCar_id);
	mysql_tquery(mMysql, query);

	UpdateRentDynamic(RentCar_id);
	DestroyDynamic3DTextLabel(RentCarData[RentCar_id][rcText]);
	DestroyDynamicPickup(RentCarData[RentCar_id][rcPickup]);
    return 1;
}
