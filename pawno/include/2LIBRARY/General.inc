#define     MAX_SKIN_ID         	299
#undef      MAX_PLAYERS
#define     MAX_PLAYERS         	100
#define     MAX_LEVEL_STAGES    	6
#define     MONEY_FOR_KILL      	150
#define     MAX_UPGRADES        	10
#define     MAX_PERSONAL_VEHICLES   3

#define     DIALOG_BLANK        0
#define     DIALOG_REGISTER     1
#define     DIALOG_LOGIN        2
#define     DIALOG_STATS        3
#define     DIALOG_MSG          4

#define     SERVER_DIRECTORY    "newmode"
#define     ACCOUNT_FOLDER      "Accounts"

new //							'startup' cluster
	Text:startup1, 	Text:startup2,  Text:startup3,
	Text:startup4,	Text:startup5;

new //                          'news' cluster
	Text:news1,     Text:news2,     Text:news3;
	
new //                          'XP' cluster
	Text:XPMain,
	PlayerText:XPLVL [ MAX_PLAYERS ] [ MAX_LEVEL_STAGES ],
	Text:XPLevelUp;

new
	StartupTD [ MAX_PLAYERS ] = 0;


stock CreateTextdraws ( )
{
	startup3 = TextDrawCreate(480.000000, 110.000000, "_~n~_~n~_~n~_~n~_~n~_~n~_~n~_~n~_~n~_~n~");
	TextDrawBackgroundColor(startup3, 255);
	TextDrawFont(startup3, 1);
	TextDrawLetterSize(startup3, 0.500000, 1.000000);
	TextDrawColor(startup3, -1);
	TextDrawSetOutline(startup3, 0);
	TextDrawSetProportional(startup3, 1);
	TextDrawSetShadow(startup3, 1);
	TextDrawUseBox(startup3, 1);
	TextDrawBoxColor(startup3, -1040845569);
	
	startup1 = TextDrawCreate(500.000000, 120.000000, "Login");
	TextDrawBackgroundColor(startup1, 255);
	TextDrawFont(startup1, 3);
	TextDrawLetterSize(startup1, 0.500000, 1.000000);
	TextDrawColor(startup1, -1);
	TextDrawSetOutline(startup1, 1);
	TextDrawSetProportional(startup1, 1);
	TextDrawSetSelectable(startup1, true);
	TextDrawTextSize(startup1, 545.000000, 10.500000);
	
	startup2 = TextDrawCreate(500.000000, 150.000000, "Register");
	TextDrawBackgroundColor(startup2, 255);
	TextDrawFont(startup2, 3);
	TextDrawLetterSize(startup2, 0.500000, 1.000000);
	TextDrawColor(startup2, -1);
	TextDrawSetOutline(startup2, 1);
	TextDrawSetProportional(startup2, 1);
	TextDrawSetSelectable(startup2, true);
	TextDrawTextSize(startup2, 576.000000, 10.500000);
	
	startup4 = TextDrawCreate(563.000000, 203.000000, "-/-");
	TextDrawBackgroundColor(startup4, 255);
	TextDrawFont(startup4, 3);
	TextDrawLetterSize(startup4, 0.500000, 1.000000);
	TextDrawColor(startup4, -1);
	TextDrawSetOutline(startup4, 1);
	TextDrawSetProportional(startup4, 1);
	TextDrawSetSelectable(startup4, true);
	
	startup5 = TextDrawCreate(500.000000, 180.000000, "Information");
	TextDrawBackgroundColor(startup5, 255);
	TextDrawFont(startup5, 3);
	TextDrawLetterSize(startup5, 0.500000, 1.000000);
	TextDrawColor(startup5, -1);
	TextDrawSetOutline(startup5, 1);
	TextDrawSetProportional(startup5, 1);
	TextDrawSetSelectable(startup5, true);
	TextDrawTextSize(startup5, 605.000000, 10.500000);
	
	news1 = TextDrawCreate(370.000000, 5.000000, "Welcome");
	TextDrawBackgroundColor(news1, 255);
	TextDrawFont(news1, 0);
	TextDrawLetterSize(news1, 0.700000, 2.000000);
	TextDrawColor(news1, -1);
	TextDrawSetOutline(news1, 1);
	TextDrawSetProportional(news1, 1);
	
	news2 = TextDrawCreate(381.000000, 30.000000, "lolhi");
	TextDrawBackgroundColor(news2, 255);
	TextDrawFont(news2, 1);
	TextDrawLetterSize(news2, 0.300000, 0.899999);
	TextDrawColor(news2, -65281);
	TextDrawSetOutline(news2, 1);
	TextDrawSetProportional(news2, 1);
	
	news3 = TextDrawCreate(642.000000, -10.000000, "_~n~_~n~_~n~_~n~_~n~_~n~_~n~_~n~_~n~_~n~_~n~_~n~_~n~");
	TextDrawBackgroundColor(news3, 255);
	TextDrawFont(news3, 1);
	TextDrawLetterSize(news3, 0.500000, 1.000000);
	TextDrawColor(news3, -1);
	TextDrawSetOutline(news3, 0);
	TextDrawSetProportional(news3, 1);
	TextDrawSetShadow(news3, 1);
	TextDrawUseBox(news3, 1);
	TextDrawBoxColor(news3, -1292372993);
	TextDrawTextSize(news3, 360.000000, 0.000000);

	XPMain = TextDrawCreate(565.000000, 423.000000, "XP");
	TextDrawBackgroundColor(XPMain, 255);
	TextDrawFont(XPMain, 1);
	TextDrawLetterSize(XPMain, 0.500000, 1.000000);
	TextDrawColor(XPMain, 16777215);
	TextDrawSetOutline(XPMain, 1);
	TextDrawSetProportional(XPMain, 1);
	
	XPLevelUp = TextDrawCreate(521.000000, 414.000000, "LEVEL UP!");
	TextDrawBackgroundColor(XPLevelUp, 255);
	TextDrawFont(XPLevelUp, 2);
	TextDrawLetterSize(XPLevelUp, 0.500000, 1.000000);
	TextDrawColor(XPLevelUp, -16776961);
	TextDrawSetOutline(XPLevelUp, 1);
	TextDrawSetProportional(XPLevelUp, 1);
	return true;
}

stock CreatePlayerTextdraws ( playerid )
{
	XPLVL[playerid][0] = CreatePlayerTextDraw(playerid, 520.000000, 430.000000, "|");
	PlayerTextDrawBackgroundColor(playerid, XPLVL[playerid][0], 255);
	PlayerTextDrawFont(playerid, XPLVL[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, XPLVL[playerid][0], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, XPLVL[playerid][0], -1);
	PlayerTextDrawSetOutline(playerid, XPLVL[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, XPLVL[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, XPLVL[playerid][0], 1);
	PlayerTextDrawUseBox(playerid, XPLVL[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, XPLVL[playerid][0], 95);
	PlayerTextDrawTextSize(playerid, XPLVL[playerid][0], 630.000000, 0.000000);
	
	XPLVL[playerid][1] = CreatePlayerTextDraw(playerid, 540.000000, 430.000000, "|");
	PlayerTextDrawBackgroundColor(playerid, XPLVL[playerid][1], 255);
	PlayerTextDrawFont(playerid, XPLVL[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, XPLVL[playerid][1], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, XPLVL[playerid][1], -1);
	PlayerTextDrawSetOutline(playerid, XPLVL[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, XPLVL[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, XPLVL[playerid][1], 1);
	PlayerTextDrawTextSize(playerid, XPLVL[playerid][1], 630.000000, 0.000000);
	
	XPLVL[playerid][2] = CreatePlayerTextDraw(playerid, 560.000000, 430.000000, "|");
	PlayerTextDrawBackgroundColor(playerid, XPLVL[playerid][2], 255);
	PlayerTextDrawFont(playerid, XPLVL[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, XPLVL[playerid][2], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, XPLVL[playerid][2], -1);
	PlayerTextDrawSetOutline(playerid, XPLVL[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, XPLVL[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, XPLVL[playerid][2], 1);
	PlayerTextDrawTextSize(playerid, XPLVL[playerid][2], 630.000000, 0.000000);
	
	XPLVL[playerid][3] = CreatePlayerTextDraw(playerid, 580.000000, 430.000000, "|");
	PlayerTextDrawBackgroundColor(playerid, XPLVL[playerid][3], 255);
	PlayerTextDrawFont(playerid, XPLVL[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, XPLVL[playerid][3], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, XPLVL[playerid][3], -1);
	PlayerTextDrawSetOutline(playerid, XPLVL[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, XPLVL[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, XPLVL[playerid][3], 1);
	PlayerTextDrawTextSize(playerid, XPLVL[playerid][3], 630.000000, 0.000000);
	
	XPLVL[playerid][4] = CreatePlayerTextDraw(playerid, 600.000000, 430.000000, "|");
	PlayerTextDrawBackgroundColor(playerid, XPLVL[playerid][4], 255);
	PlayerTextDrawFont(playerid, XPLVL[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, XPLVL[playerid][4], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, XPLVL[playerid][4], -1);
	PlayerTextDrawSetOutline(playerid, XPLVL[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, XPLVL[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, XPLVL[playerid][4], 1);
	PlayerTextDrawTextSize(playerid, XPLVL[playerid][4], 630.000000, 0.000000);
	
	XPLVL[playerid][5] = CreatePlayerTextDraw(playerid, 620.000000, 430.000000, "|");
	PlayerTextDrawBackgroundColor(playerid, XPLVL[playerid][5], 255);
	PlayerTextDrawFont(playerid, XPLVL[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, XPLVL[playerid][5], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, XPLVL[playerid][5], -1);
	PlayerTextDrawSetOutline(playerid, XPLVL[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, XPLVL[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, XPLVL[playerid][5], 1);
	PlayerTextDrawTextSize(playerid, XPLVL[playerid][5], 630.000000, 0.000000);
	return true;
}

stock HidePlayerXPBar ( playerid )
{
	for( new n; n < MAX_LEVEL_STAGES; n ++ )
	{
		PlayerTextDrawHide( playerid, XPLVL[playerid][n] );
	}
	TextDrawHideForPlayer ( playerid, XPMain );
	return true;
}

stock ShowPlayerXPBar ( playerid )
{
	for( new n; n < MAX_LEVEL_STAGES; n ++ )
	{
		PlayerTextDrawShow( playerid, XPLVL[playerid][n] );
	}
	TextDrawShowForPlayer ( playerid, XPMain );
	return true;
}

stock DestroyPlayerTextdraws ( playerid )
{
	for( new n; n < MAX_LEVEL_STAGES; n ++ )
	{
		PlayerTextDrawDestroy( playerid, XPLVL[playerid][n] );
	}
	return true;
}

stock ShowStartupTextdraws ( playerid )
{
    TextDrawShowForPlayer( playerid, startup3 );
	TextDrawShowForPlayer( playerid, startup1 );
	TextDrawShowForPlayer( playerid, startup2 );
	TextDrawShowForPlayer( playerid, startup4 );
	TextDrawShowForPlayer( playerid, startup5 );
	
	TextDrawShowForPlayer( playerid, news2 );
	TextDrawShowForPlayer( playerid, news1 );
	TextDrawShowForPlayer( playerid, news3 );

	StartupTD [ playerid ] = 1;
	return true;
}

stock HideStartupTextdraws ( playerid )
{
    TextDrawHideForPlayer( playerid, startup1 );
    TextDrawHideForPlayer( playerid, startup2 );
    TextDrawHideForPlayer( playerid, startup3 );
    TextDrawHideForPlayer( playerid, startup4 );
    TextDrawHideForPlayer( playerid, startup5 );
    
	TextDrawHideForPlayer( playerid, news1 );
	TextDrawHideForPlayer( playerid, news2 );
	TextDrawHideForPlayer( playerid, news3 );

    StartupTD [ playerid ] = 0;
	return true;
}
