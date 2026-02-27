#define MAX_PUMPKINGS 12
new Float:PumpkingsPoint[12][3] =
{
	 {-428.2909,-403.5455,16.2031},
	 {-387.5834,-422.8514,16.2031},
	 {-381.6777,-1036.5276,58.9696},
	 {-92.1855,-1211.8269,2.7074},
	 {395.5798,-1866.1759,13.6016},
	 {308.9756,-1760.4728,4.4821},
	 {1110.6565,-1875.4543,13.5469},
	 {2351.3923,-648.9348,128.0547},
	 {-90.9880,-1557.4526,2.6107},
	 {-572.9106,-1498.1198,9.5795},
	 {243.7696,-1520.6261,33.3624},
	 {570.6876,-1652.8656,17.7803}
};

CreatePumpkigsPoint()
{
    new PumpkingsCode[260];
    CreateDynamicPickup(1239, 23, 154.2416,-1946.6228,5.3903, -1);
	format(PumpkingsCode, sizeof(PumpkingsCode), "{00ff00}Event Halloween {ffffff}\n/halloween\n[{00ff00}>>Untuk claim hadiah event halloween {ffffff}]");
	CreateDynamic3DTextLabel(PumpkingsCode, COLOR_YELLOW, 154.2416,-1946.6228,5.3903, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //
	
	for(new pumpkingsx; pumpkingsx < MAX_PUMPKINGS; pumpkingsx++)
	{
	    CreatePickup(19320, 23, PumpkingsPoint[pumpkingsx][0], PumpkingsPoint[pumpkingsx][1], PumpkingsPoint[pumpkingsx][2], 0);
	    CreateDynamic3DTextLabel("pumpkins\nPress Y claim pumpkins", COLOR_ORANGE, PumpkingsPoint[pumpkingsx][0], PumpkingsPoint[pumpkingsx][1], PumpkingsPoint[pumpkingsx][2]+0.4, 10.0);
	}
}