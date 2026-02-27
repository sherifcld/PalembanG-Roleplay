#define MAX_BLACKMARKET            (200)

enum BLACKMARKET
{
	BM_ID,
	Float:BM_POS_X,
	Float:BM_POS_Y,
	Float:BM_POS_Z,
	BM_PICKUP,
	Text3D:BM_TEXT,
};
new BM_DATA[MAX_BLACKMARKET][BLACKMARKET];
new Iterator:blackmarkett<MAX_BLACKMARKET>;

epublic: LoadBmData()
{
	new string[255];
	new rows;
	rows = cache_num_rows();

	if(rows)
  	{
		for(new i; i < rows; i++)
		{
		    cache_get_value_name_int(i, "id", BM_DATA[i][BM_ID]);
			cache_get_value_name_float(i, "point_x", BM_DATA[i][BM_POS_X]);
			cache_get_value_name_float(i, "point_y", BM_DATA[i][BM_POS_Y]);
			cache_get_value_name_float(i, "point_z", BM_DATA[i][BM_POS_Z]);

			Iter_Add(blackmarkett, i);

			BM_DATA[i][BM_PICKUP] = CreateDynamicPickup(19832, 23, BM_DATA[i][BM_POS_X], BM_DATA[i][BM_POS_Y], BM_DATA[i][BM_POS_Z], 0);
			format(string, sizeof(string), "{ff0011} BLACKMARKET {FFFFFF}\n {00ff00} ID {ffee00} [%d] {FFFFFF}\n KETIK {00ff00} [/CREATEGUN] {FFFFFF} \n >> UNTUK MELIHAT MENU BLACKMARKET{FFFFFF} ", i);
			BM_DATA[i][BM_TEXT] = CreateDynamic3DTextLabel(string, COLOR_WHITE, BM_DATA[i][BM_POS_X], BM_DATA[i][BM_POS_Y], BM_DATA[i][BM_POS_Z], 4.0);
	    }
	}
	return 1;
}

stock UpdateBmDynamic(i)
{
	DestroyDynamic3DTextLabel(BM_DATA[i][BM_TEXT]);
	DestroyDynamicPickup(BM_DATA[i][BM_PICKUP]);

	new string[2048];
	BM_DATA[i][BM_PICKUP] = CreateDynamicPickup(19832, 23, BM_DATA[i][BM_POS_X], BM_DATA[i][BM_POS_Y], BM_DATA[i][BM_POS_Z], 0);
	format(string, sizeof(string), "{ff0011} BLACKMARKET {FFFFFF}\n {00ff00} ID {ffee00} [%d] {FFFFFF}\n KETIK {00ff00} [/CREATEGUN] {FFFFFF} \n >> UNTUK MELIHAT MENU BLACKMARKET{FFFFFF} ", i);
	BM_DATA[i][BM_TEXT] = CreateDynamic3DTextLabel(string, COLOR_WHITE, BM_DATA[i][BM_POS_X], BM_DATA[i][BM_POS_Y], BM_DATA[i][BM_POS_Z], 4.0);
}

CMD:createbm(playerid, params[])
{
	if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;

	new idx = Iter_Free(blackmarkett);

	new Cache:result;

 	new Float:X, Float:Y, Float:Z;
    GetPlayerPos(playerid, X, Y, Z);
    BM_DATA[idx][BM_POS_X] = X;
    BM_DATA[idx][BM_POS_Y] = Y;
	BM_DATA[idx][BM_POS_Z] = Z;

	new fmt_text[1280];
	format
	(
		fmt_text, sizeof fmt_text,
		"INSERT INTO blackmarket \
		(point_x, point_y, point_z)\
		VALUES ('%f', '%f', '%f')",
		X,
		Y,
		Z
	);

	result = mysql_query(mMysql, fmt_text, true);

	BM_DATA[idx][BM_ID] = cache_insert_id();

	cache_delete(result);

    Iter_Add(blackmarkett, idx);

	UpdateBmDynamic(idx);
	format(String, sizeof(String), "ADMINFO: %s has created BlackMarket ID %d.", GN(playerid), idx);
	SendAdminMessage(COLOR_RED, String);
	return 1;
}

CMD:removebm(playerid, params[])
{
    if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;

    new string[1280];

    extract params -> new B_ID; else return ShowInfo(playerid, "/removerent [ID]");

    if(B_ID > MAX_BLACKMARKET) return ShowError(playerid, "Wrong BlackMarket ID");
    if(B_ID < 0) return ShowError(playerid, "Wrong BlackMarket ID");

	new query[1280];
	format(string, sizeof(string), "BlackMarket deleted with ID %d.", B_ID);
	SendClientMessageEx(playerid, COLOR_GRAD1, string);
	Iter_Remove(blackmarkett, B_ID);
	mysql_format(mMysql, query, sizeof(query), "DELETE FROM blackmarket WHERE id=%d", B_ID);
	mysql_tquery(mMysql, query);

	UpdateBmDynamic(B_ID);
	DestroyDynamic3DTextLabel(BM_DATA[B_ID][BM_TEXT]);
	DestroyDynamicPickup(BM_DATA[B_ID][BM_PICKUP]);
    return 1;
}
