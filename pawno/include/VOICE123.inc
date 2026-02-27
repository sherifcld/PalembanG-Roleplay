#if !defined FILTERSCRIPT

#if defined Voiced_OnGameModeInit
	forward Voiced_OnGameModeInit();
#endif

public OnGameModeInit()
{
	print("[SAMPVOICE] AGUSSAMP LOAD");
	print("[SAMPVOICE] SUPPORT ALL HOSTING");
	print("[SAMPVOICE] BY CYBERARMOR");
	#if defined Voiced_OnGameModeInit
		return Voiced_OnGameModeInit();
	#else
		return 1;
	#endif
}

#if defined _ALS_OnGameModeInit
  #undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit Voiced_OnGameModeInit

#endif

#if defined Voiced_OnPlayerConnect
	forward Voiced_OnPlayerConnect(playerid);
#endif

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, -1, "[SAMPVOICE] SERVER INI MENGGUNAKAN VOICE HOSTING CLOUD, PREMIUM, DEWORLDSPEED AGUSSAMP STORE");
    printf("[SAMPVOICE] SERVER INI MENGGUNAKAN VOICE HOSTING CLOUD, PREMIUM, DEWORLDSPEED AGUSSAMP STORE");
	#if defined Voiced_OnPlayerConnect
		return Voiced_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnPlayerConnect
  #undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect Voiced_OnPlayerConnect
