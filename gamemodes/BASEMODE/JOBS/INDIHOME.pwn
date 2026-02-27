#define MAX_RANDOM_INDIHOME 7
new Float:RandomIndiHome[7][3] =
{
	 {485.2484,-1769.6877,14.1532},
	 {1832.2205,-1797.7079,13.5469},
	 {1970.6943,-1772.8734,13.5469},
	 {1974.0111,-1892.3622,13.5469},
	 {-70.1725,-1596.8580,2.6172},
	 {353.1735,-2053.3760,7.8359},
	 {1974.0111,-1892.3622,13.5469}
};

CreatePointIndiHome()
{
    new StrCodeIndiHome[260];
	format(StrCodeIndiHome, sizeof(StrCodeIndiHome), "DUTY INDIHOME\n TEKAN Y\n OFFDUTY INDIHOME /DUTYINDIHOME \n >> UNTUK BEKERJA MENJADI PETUGAS INDIHOME");
	CreateDynamic3DTextLabel(StrCodeIndiHome, COLOR_YELLOW, 242.5694, -1528.9821, 33.4624, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //
	
	format(StrCodeIndiHome, sizeof(StrCodeIndiHome), "VEHICLE PETUGAS TEKAN \n Y \n >> UNTUK MEGAMBIL KENDARAAN PETUGAS INDIHOME");
	CreateDynamic3DTextLabel(StrCodeIndiHome, COLOR_YELLOW, 211.0051, -1544.5043, 33.3624, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //

	CreateActor(260, 242.5694,-1528.9821,33.4624,149.2595);
    CreateActor(93, 211.0051,-1544.5043,33.3624,246.5388);

	for(new IndiHome; IndiHome < MAX_RANDOM_INDIHOME; IndiHome++)
	{
	    CreatePickup(1252, 23, RandomIndiHome[IndiHome][0], RandomIndiHome[IndiHome][1], RandomIndiHome[IndiHome][2], 0);
	    CreateDynamic3DTextLabel("SERVICE INDIHOME\n TEKAN : Y \n >> UNTUK MELAKUKAN SERVICE", COLOR_YELLOW, RandomIndiHome[IndiHome][0], RandomIndiHome[IndiHome][1], RandomIndiHome[IndiHome][2], 10.0);
	}
}

CMD:hsvr(playerid)
{
    if(DutyIndiHome[playerid] == 0) return ShowError(playerid, "Anda Belum Bekerjaan Sebagai Petugas IndiHome");
    if(IndiHomeStart[playerid] == 1) return ShowError(playerid, "Anda Sudah Melakukan Pencarian Tiang");
    
    new rand = random(7);
    SetPlayerCheckpoint(playerid, RandomIndiHome[rand][0], RandomIndiHome[rand][1], RandomIndiHome[rand][2], 1.0);
    IndiHomeStart[playerid] = 1;
    DarryDerrSystem[playerid] = rand;
    ShowInfo(playerid, "Anda Sekarang Berhasil Menemukan Tiang Rusak Segera Ke Sana");
    KirimPesan(playerid, -1, "{00ff00}INFO: {ffffff}Anda Sekarang Berhasil Menemukan Tiang Rusak Segera Ke Sana");
	return 1;
}
