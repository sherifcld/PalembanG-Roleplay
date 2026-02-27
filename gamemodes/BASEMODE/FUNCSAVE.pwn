stock UpdateNewALL(playerid)
{
    OnPlayerUpdateAccountsPer(playerid, "pSampah", PlayerInfo[playerid][pSampah]);
    OnPlayerUpdateAccountsPer(playerid, "pPancing", PlayerInfo[playerid][pPancing]);
    OnPlayerUpdateAccountsPer(playerid, "pBait", PlayerInfo[playerid][pBait]);
    OnPlayerUpdateAccountsPer(playerid, "pIkan", PlayerInfo[playerid][pIkan]);
    OnPlayerUpdateAccountsPer(playerid, "TimeAcceptdeath", PlayerInfo[playerid][TimeAcceptdeath]);
    OnPlayerUpdateAccountsPer(playerid, "pInjured", PlayerInfo[playerid][pInjured]);
    OnPlayerUpdateAccountsPer(playerid, "pAcceptDeath", PlayerInfo[playerid][pAcceptDeath]);
    OnPlayerUpdateAccountsPer(playerid, "pLastInju", PlayerInfo[playerid][pLastInju]);
    return 1;
}

stock ResetVariabel(playerid)
{
    return 1;
}

stock HideDutyAdmin(playerid)
{
    TextDrawHideForPlayer(playerid, DUTYADMIN[0]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[1]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[2]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[3]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[4]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[5]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[6]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[7]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[8]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[9]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[10]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[11]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[12]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[13]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[14]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[15]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[16]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[17]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[18]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[19]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[20]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[21]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[22]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[23]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[24]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[25]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[26]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[27]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[28]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[29]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[30]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[31]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[32]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[33]);
    TextDrawHideForPlayer(playerid, DUTYADMIN[34]);
    CancelSelectTextDraw(playerid);
    return 1;
}

stock HideLocker(playerid)
{
    if(PlayerInfo[playerid][pLogin] != 1) return KickD(playerid, "Anda harus masuk untuk memulai permainan!");
    {
        TextDrawHideForPlayer(playerid, DUTYUPDATE[0]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[1]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[2]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[3]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[4]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[5]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[6]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[7]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[8]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[9]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[10]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[11]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[12]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[13]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[14]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[15]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[16]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[17]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[18]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[19]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[20]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[21]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[22]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[23]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[24]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[25]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[26]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[27]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[28]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[29]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[30]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[31]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[32]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[33]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[34]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[35]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[36]);
        TextDrawHideForPlayer(playerid, DUTYUPDATE[37]);
        CancelSelectTextDraw(playerid);
    }
    return 1;
}

stock ShowFish(playerid)
{
    TextDrawShowForPlayer(playerid, FISHTDNEW[0]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[1]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[2]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[3]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[4]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[5]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[6]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[7]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[8]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[9]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[10]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[11]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[12]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[13]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[14]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[15]);
    TextDrawShowForPlayer(playerid, FISHTDNEW[16]);
    return 1;
}

epublic: HideFish(playerid)
{
    TextDrawHideForPlayer(playerid, FISHTDNEW[0]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[1]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[2]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[3]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[4]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[5]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[6]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[7]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[8]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[9]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[10]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[11]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[12]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[13]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[14]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[15]);
    TextDrawHideForPlayer(playerid, FISHTDNEW[16]);
    KillTimer(FishTimerTD[playerid]);
    return 1;
}