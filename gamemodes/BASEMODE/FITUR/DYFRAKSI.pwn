#define MAX_DYFRAKSI (100)
enum E_FRAKSIVEH
{
	FR_ID,
	Float:FR_POS_X,
	Float:FR_POS_Y,
	Float:FR_POS_Z,
	FR_TYPE,
	FR_PICKUP_1,
	Text3D: FR_TEXT_1
};

new VEHSPAWNDATA[MAX_DYFRAKSI][E_FRAKSIVEH];
new Iterator:spawnvehdb<MAX_DYFRAKSI>;

epublic: LoadDynamicFraksi()
{
	new string[1248];
	new rows;
	rows = cache_num_rows();

	if(rows)
  	{
		for(new i; i < rows; i++)
		{
		    cache_get_value_name_int(i, "id", VEHSPAWNDATA[i][FR_ID]);

			cache_get_value_name_float(i, "point_x", VEHSPAWNDATA[i][FR_POS_X]);
			cache_get_value_name_float(i, "point_y", VEHSPAWNDATA[i][FR_POS_Y]);
			cache_get_value_name_float(i, "point_z", VEHSPAWNDATA[i][FR_POS_Z]);

			cache_get_value_name_int(i, "Type", VEHSPAWNDATA[i][FR_TYPE]);

			Iter_Add(spawnvehdb, i);

			if(VEHSPAWNDATA[i][FR_TYPE] == 1)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}LSPD{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 2)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}FBI{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 3)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}ANGKATAN DARAT{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 4)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}PEMERINTAH{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 5)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}RUMAH SAKIT LS{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 6)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}PUSAT RADIO{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 7)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}MC{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 8)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}EAST SIDE BALLAS{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 9)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}VAGOS{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 10)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}RUSSIA MAFIA{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 11)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}GROVE GANG{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 12)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}AZTECAS{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 13)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}RIFA GANG{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 14)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}ANGKATAN LAUT{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 15)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}ANGKATAN UDARA{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 16)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}YAKUZA MAFIA{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 17)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}CUOLUMBIA{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 18)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}POLISI SF{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 19)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}POLISI LV{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 20)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}RUMAH SAKIT SF{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 21)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}RUMAH SAKIT LV{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 22)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}MEKANIK{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
			if(VEHSPAWNDATA[i][FR_TYPE] == 23)
		    {
				VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
				format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}PEDAGANG{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
				VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
			}
	    }
	    printf("[DYNAMIC FRAKSI] Number of Loaded: %d.", rows);
	}
	return 1;
}

stock FraksiSaveSpawn(id)
{
	new cQuery[998];
	format(cQuery, sizeof(cQuery), "UPDATE spawnvehdb SET point_x='%f', point_y='%f', point_z='%f', Type='%d' WHERE id='%d'",
	VEHSPAWNDATA[id][FR_POS_X],
    VEHSPAWNDATA[id][FR_POS_Y],
	VEHSPAWNDATA[id][FR_POS_Z],
	VEHSPAWNDATA[id][FR_TYPE],
	id);
	return mysql_tquery(mMysql, cQuery);
}

stock FraksiUpdateLabel(i)
{
    if(IsValidDynamic3DTextLabel(VEHSPAWNDATA[i][FR_TEXT_1])) DestroyDynamic3DTextLabel(VEHSPAWNDATA[i][FR_TEXT_1]);
    if(IsValidDynamicPickup(VEHSPAWNDATA[i][FR_PICKUP_1])) DestroyDynamicPickup(VEHSPAWNDATA[i][FR_PICKUP_1]);
	new string[2048];

    if(VEHSPAWNDATA[i][FR_TYPE] == 1)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}LSPD{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 2)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}FBI{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 3)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}ANGKATAN DARAT{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 4)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}PEMERINTAH{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 5)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}RUMAH SAKIT LS{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 6)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}PUSAT RADIO{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 7)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}MC{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 8)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}EAST SIDE BALLAS{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 9)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}VAGOS{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 10)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}RUSSIA MAFIA{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 11)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}GROVE GANG{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 12)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}AZTECAS{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 13)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}RIFA GANG{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 14)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}ANGKATAN LAUT{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 15)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}ANGKATAN UDARA{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 16)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}YAKUZA MAFIA{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 17)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}CUOLUMBIA{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 18)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}POLISI SF{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 19)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}POLISI LV{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 20)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}RUMAH SAKIT SF{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 21)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}RUMAH SAKIT LV{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 22)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}MEKANIK{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	if(VEHSPAWNDATA[i][FR_TYPE] == 23)
    {
		VEHSPAWNDATA[i][FR_PICKUP_1] = CreateDynamicPickup(1239, 23, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 0);
		format(string, sizeof(string), "FRAKSI ID : {ffff00} [%d]{ffffff}\n FRAKSI NAME : {ffff00}PEDAGANG{ffffff}\n TEKAN : {32cd32} Y {ffffff}", i);
		VEHSPAWNDATA[i][FR_TEXT_1] = CreateDynamic3DTextLabel(string, COLOR_WHITE, VEHSPAWNDATA[i][FR_POS_X], VEHSPAWNDATA[i][FR_POS_Y], VEHSPAWNDATA[i][FR_POS_Z], 4.0);
	}
	return 1;
}

CMD:createspawn(playerid, params[])
{
	if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;

	new Type;
	if(sscanf(params,"d", Type)) return SCM(playerid, -1, "USAGE: /createspawn <FraksiType /makeleader untuk melihat type>");

	new idx = Iter_Free(spawnvehdb);

	new Cache:result;

 	new Float:X, Float:Y, Float:Z;
    GetPlayerPos(playerid, X, Y, Z);
    VEHSPAWNDATA[idx][FR_POS_X] = X;
    VEHSPAWNDATA[idx][FR_POS_Y] = Y;
	VEHSPAWNDATA[idx][FR_POS_Z] = Z;
	VEHSPAWNDATA[idx][FR_TYPE] = Type;

	new fmt_text[2048];
	format
	(
		fmt_text, sizeof fmt_text,
		"INSERT INTO spawnvehdb \
		(point_x, point_y, point_z, Type)\
		VALUES ('%f', '%f', '%f', '%d')",
		X,
		Y,
 		Z,
 		Type
	);

	result = mysql_query(mMysql, fmt_text, true);

	VEHSPAWNDATA[idx][FR_ID] = cache_insert_id();

	cache_delete(result);
    Iter_Add(spawnvehdb, idx);
	FraksiSaveSpawn(idx);
	FraksiUpdateLabel(idx);
	format(String, sizeof(String), "ADMINFO: [%s] BERHASIL MEMBUAT DYNAMIC SPAWN KENDARAAN ID [%d]", GN(playerid), idx);
	SendAdminMessage(COLOR_YELLOW, String);
	return 1;
}

CMD:removespawn(playerid, params[])
{
    if(admin_level[playerid] < 7 || !admin_logged[playerid]) return 1;

    new string[1280];

    extract params -> new WSID; else return SCM(playerid, -1, "/removespawn [DYNAMIC ID]");

    if(WSID > MAX_DYFRAKSI) return SCM(playerid, -1, "WRONG ID");
    if(WSID < 0) return SCM(playerid, -1, "WRONG ID");

	new query[1280];
	format(string, sizeof(string), "DYNAMIC SPAWN VEH ID [%d] DELATE", WSID);
	SendClientMessageEx(playerid, COLOR_GRAD1, string);
	Iter_Remove(spawnvehdb, WSID);
	mysql_format(mMysql, query, sizeof(query), "DELETE FROM spawnvehdb WHERE id=%d", WSID);
	mysql_tquery(mMysql, query);
    return 1;
}

CMD:vehtake(playerid)
{
    foreach(new idx : spawnvehdb)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, VEHSPAWNDATA[idx][FR_POS_X], VEHSPAWNDATA[idx][FR_POS_Y], VEHSPAWNDATA[idx][FR_POS_Z]))
	    {
	        if(VEHSPAWNDATA[idx][FR_TYPE] == 1)
	        {
	            if(PlayerInfo[playerid][pMember] != FRACTION_LSPD) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
				format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_LSPD_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 2)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_FBI) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_FBI_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 3)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_ARMY_LS) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_ARMYLS_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
		    }
		    if(VEHSPAWNDATA[idx][FR_TYPE] == 4)
	        {
	            if(PlayerInfo[playerid][pMember] != FRACTION_MAYOR) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
	        	format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_MAYOR_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 5)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_LSMEDICS) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_MEDISLS_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 6)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_NEWS) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_NEWSCAR_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
		    }
		    if(VEHSPAWNDATA[idx][FR_TYPE] == 7)
	        {
	            if(PlayerInfo[playerid][pMember] != FRACTION_BIKER) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
	            format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_BIKER_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 8)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_BALLAS) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_BALLAS_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 9)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_VAGOS) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_VAGOS_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
		    }
		    if(VEHSPAWNDATA[idx][FR_TYPE] == 10)
	        {
	            if(PlayerInfo[playerid][pMember] != FRACTION_RUMAFIA) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
	            format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_RUMAFIA_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 11)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_GROVE) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_GROVE_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 12)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_RUMAFIA) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_AZTEC_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
		    }
		    if(VEHSPAWNDATA[idx][FR_TYPE] == 13)
	        {
	            if(PlayerInfo[playerid][pMember] != FRACTION_RIFA) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
	            format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_RIFA_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 14)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_ARMY_SF) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_ARMYSF_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 15)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_ARMY_LV) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_ARMYLV_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
		    }
		    if(VEHSPAWNDATA[idx][FR_TYPE] == 16)
	        {
	            if(PlayerInfo[playerid][pMember] != FRACTION_YAKUZA) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
	            format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_YAKUZA_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 17)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_COLUMBIA) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_COLUMBIA_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 18)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_SFPD) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_SFPD_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
		    }
		    if(VEHSPAWNDATA[idx][FR_TYPE] == 19)
	        {
	            if(PlayerInfo[playerid][pMember] != FRACTION_LVPD) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
	        	format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_LVPD_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 20)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_SFMEDICS) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_MEDISSF_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 21)
			{
			    if(PlayerInfo[playerid][pMember] != FRACTION_LVMEDICS) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
			    format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_MEDISLV_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
		    }
		    if(VEHSPAWNDATA[idx][FR_TYPE] == 22)
	        {
	            if(PlayerInfo[playerid][pMember] != FRACTION_MECHANIK) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
	            format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_MEKANIK_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
			if(VEHSPAWNDATA[idx][FR_TYPE] == 23)
	        {
	            if(PlayerInfo[playerid][pMember] != FRACTION_PEDAGANG) return SCM(playerid, -1,"Anda tidak dapat menggunakan perintah ini.");
	            format(String, sizeof String, "SPAWN CAR");
            	ShowPlayerDialog(playerid, DIALOG_PEDAGANG_CAR, DIALOG_STYLE_LIST, "GARAGE 2K24", String, "Select", "Quit");
			}
	    }
	}
	return 1;
}