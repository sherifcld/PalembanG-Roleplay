#define 	ResetMoneyBar 			ResetPlayerMoney
#define 	UpdateMoneyBar 			GivePlayerMoney
#define 	PRESSED(%0) \
				(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

stock accPath ( playerid )
{
	new
	    actualPath [ 40 + MAX_PLAYER_NAME ], p_Name [ MAX_PLAYER_NAME ];

	GetPlayerName( playerid, p_Name, sizeof( p_Name ) );

	format( actualPath, sizeof( actualPath ), "%s/%s/%s.ini", SERVER_DIRECTORY, ACCOUNT_FOLDER, p_Name );
	return actualPath;
}

/*Credits to Dracoblue*/
stock udb_hash(buf[]) {
    new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
       s1 = (s1 + buf[n]) % 65521;
       s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}


