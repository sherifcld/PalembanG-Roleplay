#define DIALOG_TOYPOSISI 8987
#define DIALOG_TOYEDIT 8989
#define DIALOG_TOY 8990
#define DIALOG_BUY_TOYS 8991
#define DIALOG_TOYPOSISIBUY 8992
#define DIALOG_TOY_POS_X 8993
#define DIALOG_TOY_POS_Y 8994
#define DIALOG_TOY_POS_Z 8995
#define DIALOG_TOY_ROT_X 8996
#define DIALOG_TOY_ROT_Y 8997
#define DIALOG_TOY_ROT_Z 8998
#define DIALOG_TOY_SIZE_X 8999
#define DIALOG_TOY_SIZE_Y 9000
#define DIALOG_TOY_SIZE_Z 9001

enum DarryDerrToys
{
	T_MODEL,
	T_BONE,
	Float:T_POS_X,
	Float:T_POS_Y,
	Float:T_POS_Z,
	Float:T_ROT_X,
	Float:T_ROT_Y,
	Float:T_ROT_Z,
	Float:T_SIZE_X,
	Float:T_SIZE_Y,
	Float:T_SIZE_Z,
	T_TOGGLE
}
new PlayerToys[MAX_PLAYERS][8][DarryDerrToys];
new T_SELECT[MAX_PLAYERS];
new ListBuyToys = mS_INVALID_LISTID;

CMD:toys(playerid)
{
	new string[350];
	if(PlayerToys[playerid][0][T_MODEL] == 0)
	{
	    strcat(string, "Slot 1 [{ff0000}Empty{ffffff}]\n");
	}
	else strcat(string, "Slot 1 [{00ff00}Ready{ffffff}]\n");

	if(PlayerToys[playerid][1][T_MODEL] == 0)
	{
	    strcat(string, "Slot 2 [{ff0000}Empty{ffffff}]\n");
	}
	else strcat(string, "Slot 2 [{00ff00}Ready{ffffff}]\n");

	if(PlayerToys[playerid][2][T_MODEL] == 0)
	{
	    strcat(string, "Slot 3 [{ff0000}Empty{ffffff}]\n");
	}
	else strcat(string, "Slot 3 [{00ff00}Ready{ffffff}]\n");

	if(PlayerToys[playerid][3][T_MODEL] == 0)
	{
	    strcat(string, "Slot 4 [{ff0000}Empty{ffffff}]\n");
	}
	else strcat(string, "Slot 4 [{00ff00}Ready{ffffff}]\n");

	if(PlayerToys[playerid][4][T_MODEL] == 0)
	{
	    strcat(string, "Slot 5 [{ff0000}Empty{ffffff}]\n");
	}
	else strcat(string, "Slot 5 [{00ff00}Ready{ffffff}]\n");

	if(PlayerToys[playerid][5][T_MODEL] == 0)
	{
	    strcat(string, "Slot 6 [{ff0000}Empty{ffffff}]\n");
	}
	else strcat(string, "Slot 6 [{00ff00}Ready{ffffff}]\n");

	if(PlayerToys[playerid][6][T_MODEL] == 0)
	{
	    strcat(string, "Slot 7 [{ff0000}Empty{ffffff}]\n");
	}
	else strcat(string, "Slot 7 [{00ff00}Ready{ffffff}]\n");

	if(PlayerToys[playerid][7][T_MODEL] == 0)
	{
	    strcat(string, "Slot 8 [{ff0000}Empty{ffffff}]\n");
	}
	else strcat(string, "Slot 8 [{00ff00}Ready{ffffff}]\n");

	strcat(string, ">{ff0000}Reset Toys{ffffff}<");

	ShowPlayerDialog(playerid, DIALOG_TOY, DIALOG_STYLE_LIST, "Player Toys", string, "Select", "Cancel");
	return 1;
}

forward SavePlayerToys(playerid);
public SavePlayerToys(playerid)
{
	new file[128];
	format(file, sizeof file, "Toys/Player-%s.txt", GetName(playerid));
	if(dini_Exists(file))
	{
		dini_IntSet(file, "SLOT-0_Model", PlayerToys[playerid][0][T_MODEL]);
		dini_IntSet(file, "SLOT-0_Bone", PlayerToys[playerid][0][T_BONE]);
		dini_FloatSet(file, "SLOT-0_PosX", PlayerToys[playerid][0][T_POS_X]);
		dini_FloatSet(file, "SLOT-0_PosY", PlayerToys[playerid][0][T_POS_Y]);
		dini_FloatSet(file, "SLOT-0_PosZ", PlayerToys[playerid][0][T_POS_Z]);
		dini_FloatSet(file, "SLOT-0_RotX", PlayerToys[playerid][0][T_ROT_X]);
		dini_FloatSet(file, "SLOT-0_RotY", PlayerToys[playerid][0][T_ROT_Y]);
		dini_FloatSet(file, "SLOT-0_RotZ", PlayerToys[playerid][0][T_ROT_Z]);
		dini_FloatSet(file, "SLOT-0_SizeX", PlayerToys[playerid][0][T_SIZE_X]);
		dini_FloatSet(file, "SLOT-0_SizeY", PlayerToys[playerid][0][T_SIZE_Y]);
		dini_FloatSet(file, "SLOT-0_SizeZ", PlayerToys[playerid][0][T_SIZE_Z]);
		dini_IntSet(file, "SLOT-0_Toggle", PlayerToys[playerid][0][T_TOGGLE]);
		dini_IntSet(file, "SLOT-1_Model", PlayerToys[playerid][1][T_MODEL]);
		dini_IntSet(file, "SLOT-1_Bone", PlayerToys[playerid][1][T_BONE]);
		dini_FloatSet(file, "SLOT-1_PosX", PlayerToys[playerid][1][T_POS_X]);
		dini_FloatSet(file, "SLOT-1_PosY", PlayerToys[playerid][1][T_POS_Y]);
		dini_FloatSet(file, "SLOT-1_PosZ", PlayerToys[playerid][1][T_POS_Z]);
		dini_FloatSet(file, "SLOT-1_RotX", PlayerToys[playerid][1][T_ROT_X]);
		dini_FloatSet(file, "SLOT-1_RotY", PlayerToys[playerid][1][T_ROT_Y]);
		dini_FloatSet(file, "SLOT-1_RotZ", PlayerToys[playerid][1][T_ROT_Z]);
		dini_FloatSet(file, "SLOT-1_SizeX", PlayerToys[playerid][1][T_SIZE_X]);
		dini_FloatSet(file, "SLOT-1_SizeY", PlayerToys[playerid][1][T_SIZE_Y]);
		dini_FloatSet(file, "SLOT-1_SizeZ", PlayerToys[playerid][1][T_SIZE_Z]);
		dini_IntSet(file, "SLOT-1_Toggle", PlayerToys[playerid][1][T_TOGGLE]);
		dini_IntSet(file, "SLOT-2_Model", PlayerToys[playerid][2][T_MODEL]);
		dini_IntSet(file, "SLOT-2_Bone", PlayerToys[playerid][2][T_BONE]);
		dini_FloatSet(file, "SLOT-2_PosX", PlayerToys[playerid][2][T_POS_X]);
		dini_FloatSet(file, "SLOT-2_PosY", PlayerToys[playerid][2][T_POS_Y]);
		dini_FloatSet(file, "SLOT-2_PosZ", PlayerToys[playerid][2][T_POS_Z]);
		dini_FloatSet(file, "SLOT-2_RotX", PlayerToys[playerid][2][T_ROT_X]);
		dini_FloatSet(file, "SLOT-2_RotY", PlayerToys[playerid][2][T_ROT_Y]);
		dini_FloatSet(file, "SLOT-2_RotZ", PlayerToys[playerid][2][T_ROT_Z]);
		dini_FloatSet(file, "SLOT-2_SizeX", PlayerToys[playerid][2][T_SIZE_X]);
		dini_FloatSet(file, "SLOT-2_SizeY", PlayerToys[playerid][2][T_SIZE_Y]);
		dini_FloatSet(file, "SLOT-2_SizeZ", PlayerToys[playerid][2][T_SIZE_Z]);
		dini_IntSet(file, "SLOT-2_Toggle", PlayerToys[playerid][2][T_TOGGLE]);
		dini_IntSet(file, "SLOT-3_Model", PlayerToys[playerid][3][T_MODEL]);
		dini_IntSet(file, "SLOT-3_Bone", PlayerToys[playerid][3][T_BONE]);
		dini_FloatSet(file, "SLOT-3_PosX", PlayerToys[playerid][3][T_POS_X]);
		dini_FloatSet(file, "SLOT-3_PosY", PlayerToys[playerid][3][T_POS_Y]);
		dini_FloatSet(file, "SLOT-3_PosZ", PlayerToys[playerid][3][T_POS_Z]);
		dini_FloatSet(file, "SLOT-3_RotX", PlayerToys[playerid][3][T_ROT_X]);
		dini_FloatSet(file, "SLOT-3_RotY", PlayerToys[playerid][3][T_ROT_Y]);
		dini_FloatSet(file, "SLOT-3_RotZ", PlayerToys[playerid][3][T_ROT_Z]);
		dini_FloatSet(file, "SLOT-3_SizeX", PlayerToys[playerid][3][T_SIZE_X]);
		dini_FloatSet(file, "SLOT-3_SizeY", PlayerToys[playerid][3][T_SIZE_Y]);
		dini_FloatSet(file, "SLOT-3_SizeZ", PlayerToys[playerid][3][T_SIZE_Z]);
		dini_IntSet(file, "SLOT-3_Toggle", PlayerToys[playerid][3][T_TOGGLE]);
		dini_IntSet(file, "SLOT-4_Model", PlayerToys[playerid][4][T_MODEL]);
		dini_IntSet(file, "SLOT-4_Bone", PlayerToys[playerid][4][T_BONE]);
		dini_FloatSet(file, "SLOT-4_PosX", PlayerToys[playerid][4][T_POS_X]);
		dini_FloatSet(file, "SLOT-4_PosY", PlayerToys[playerid][4][T_POS_Y]);
		dini_FloatSet(file, "SLOT-4_PosZ", PlayerToys[playerid][4][T_POS_Z]);
		dini_FloatSet(file, "SLOT-4_RotX", PlayerToys[playerid][4][T_ROT_X]);
		dini_FloatSet(file, "SLOT-4_RotY", PlayerToys[playerid][4][T_ROT_Y]);
		dini_FloatSet(file, "SLOT-4_RotZ", PlayerToys[playerid][4][T_ROT_Z]);
		dini_FloatSet(file, "SLOT-4_SizeX", PlayerToys[playerid][4][T_SIZE_X]);
		dini_FloatSet(file, "SLOT-4_SizeY", PlayerToys[playerid][4][T_SIZE_Y]);
		dini_FloatSet(file, "SLOT-4_SizeZ", PlayerToys[playerid][4][T_SIZE_Z]);
		dini_IntSet(file, "SLOT-4_Toggle", PlayerToys[playerid][4][T_TOGGLE]);
		dini_IntSet(file, "SLOT-5_Model", PlayerToys[playerid][5][T_MODEL]);
		dini_IntSet(file, "SLOT-5_Bone", PlayerToys[playerid][5][T_BONE]);
		dini_FloatSet(file, "SLOT-5_PosX", PlayerToys[playerid][5][T_POS_X]);
		dini_FloatSet(file, "SLOT-5_PosY", PlayerToys[playerid][5][T_POS_Y]);
		dini_FloatSet(file, "SLOT-5_PosZ", PlayerToys[playerid][5][T_POS_Z]);
		dini_FloatSet(file, "SLOT-5_RotX", PlayerToys[playerid][5][T_ROT_X]);
		dini_FloatSet(file, "SLOT-5_RotY", PlayerToys[playerid][5][T_ROT_Y]);
		dini_FloatSet(file, "SLOT-5_RotZ", PlayerToys[playerid][5][T_ROT_Z]);
		dini_FloatSet(file, "SLOT-5_SizeX", PlayerToys[playerid][5][T_SIZE_X]);
		dini_FloatSet(file, "SLOT-5_SizeY", PlayerToys[playerid][5][T_SIZE_Y]);
		dini_FloatSet(file, "SLOT-5_SizeZ", PlayerToys[playerid][5][T_SIZE_Z]);
		dini_IntSet(file, "SLOT-5_Toggle", PlayerToys[playerid][5][T_TOGGLE]);
		dini_IntSet(file, "SLOT-6_Model", PlayerToys[playerid][6][T_MODEL]);
		dini_IntSet(file, "SLOT-6_Bone", PlayerToys[playerid][6][T_BONE]);
		dini_FloatSet(file, "SLOT-6_PosX", PlayerToys[playerid][6][T_POS_X]);
		dini_FloatSet(file, "SLOT-6_PosY", PlayerToys[playerid][6][T_POS_Y]);
		dini_FloatSet(file, "SLOT-6_PosZ", PlayerToys[playerid][6][T_POS_Z]);
		dini_FloatSet(file, "SLOT-6_RotX", PlayerToys[playerid][6][T_ROT_X]);
		dini_FloatSet(file, "SLOT-6_RotY", PlayerToys[playerid][6][T_ROT_Y]);
		dini_FloatSet(file, "SLOT-6_RotZ", PlayerToys[playerid][6][T_ROT_Z]);
		dini_FloatSet(file, "SLOT-6_SizeX", PlayerToys[playerid][6][T_SIZE_X]);
		dini_FloatSet(file, "SLOT-6_SizeY", PlayerToys[playerid][6][T_SIZE_Y]);
		dini_FloatSet(file, "SLOT-6_SizeZ", PlayerToys[playerid][6][T_SIZE_Z]);
		dini_IntSet(file, "SLOT-6_Toggle", PlayerToys[playerid][6][T_TOGGLE]);
		dini_IntSet(file, "SLOT-7_Model", PlayerToys[playerid][7][T_MODEL]);
		dini_IntSet(file, "SLOT-7_Bone", PlayerToys[playerid][7][T_BONE]);
		dini_FloatSet(file, "SLOT-7_PosX", PlayerToys[playerid][7][T_POS_X]);
		dini_FloatSet(file, "SLOT-7_PosY", PlayerToys[playerid][7][T_POS_Y]);
		dini_FloatSet(file, "SLOT-7_PosZ", PlayerToys[playerid][7][T_POS_Z]);
		dini_FloatSet(file, "SLOT-7_RotX", PlayerToys[playerid][7][T_ROT_X]);
		dini_FloatSet(file, "SLOT-7_RotY", PlayerToys[playerid][7][T_ROT_Y]);
		dini_FloatSet(file, "SLOT-7_RotZ", PlayerToys[playerid][7][T_ROT_Z]);
		dini_FloatSet(file, "SLOT-7_SizeX", PlayerToys[playerid][7][T_SIZE_X]);
		dini_FloatSet(file, "SLOT-7_SizeY", PlayerToys[playerid][7][T_SIZE_Y]);
		dini_FloatSet(file, "SLOT-7_SizeZ", PlayerToys[playerid][7][T_SIZE_Z]);
		dini_IntSet(file, "SLOT-7_Toggle", PlayerToys[playerid][7][T_TOGGLE]);
	}
	return 1;
}

forward LoadPlayerToys(playerid);
public LoadPlayerToys(playerid)
{
	new file[128];
	format(file, sizeof file, "Toys/Player-%s.txt", GetName(playerid));
	if(dini_Exists(file))
	{
		PlayerToys[playerid][0][T_MODEL] = dini_Int(file, "SLOT-0_Model");
		PlayerToys[playerid][0][T_BONE] = dini_Int(file, "SLOT-0_Bone");
		PlayerToys[playerid][0][T_POS_X] = dini_Float(file, "SLOT-0_PosX");
		PlayerToys[playerid][0][T_POS_Y] = dini_Float(file, "SLOT-0_PosY");
		PlayerToys[playerid][0][T_POS_Z] = dini_Float(file, "SLOT-0_PosZ");
		PlayerToys[playerid][0][T_ROT_X] = dini_Float(file, "SLOT-0_RotX");
		PlayerToys[playerid][0][T_ROT_Y] = dini_Float(file, "SLOT-0_RotY");
		PlayerToys[playerid][0][T_ROT_Z] = dini_Float(file, "SLOT-0_RotZ");
		PlayerToys[playerid][0][T_SIZE_X] = dini_Float(file, "SLOT-0_SizeX");
		PlayerToys[playerid][0][T_SIZE_Y] = dini_Float(file, "SLOT-0_SizeY");
		PlayerToys[playerid][0][T_SIZE_Z] = dini_Float(file, "SLOT-0_SizeZ");
		PlayerToys[playerid][0][T_TOGGLE] = dini_Int(file, "SLOT-0_Toggle");
		PlayerToys[playerid][1][T_MODEL] = dini_Int(file, "SLOT-1_Model");
		PlayerToys[playerid][1][T_BONE] = dini_Int(file, "SLOT-1_Bone");
		PlayerToys[playerid][1][T_POS_X] = dini_Float(file, "SLOT-1_PosX");
		PlayerToys[playerid][1][T_POS_Y] = dini_Float(file, "SLOT-1_PosY");
		PlayerToys[playerid][1][T_POS_Z] = dini_Float(file, "SLOT-1_PosZ");
		PlayerToys[playerid][1][T_ROT_X] = dini_Float(file, "SLOT-1_RotX");
		PlayerToys[playerid][1][T_ROT_Y] = dini_Float(file, "SLOT-1_RotY");
		PlayerToys[playerid][1][T_ROT_Z] = dini_Float(file, "SLOT-1_RotZ");
		PlayerToys[playerid][1][T_SIZE_X] = dini_Float(file, "SLOT-1_SizeX");
		PlayerToys[playerid][1][T_SIZE_Y] = dini_Float(file, "SLOT-1_SizeY");
		PlayerToys[playerid][1][T_SIZE_Z] = dini_Float(file, "SLOT-1_SizeZ");
		PlayerToys[playerid][1][T_TOGGLE] = dini_Int(file, "SLOT-1_Toggle");
		PlayerToys[playerid][2][T_MODEL] = dini_Int(file, "SLOT-2_Model");
		PlayerToys[playerid][2][T_BONE] = dini_Int(file, "SLOT-2_Bone");
		PlayerToys[playerid][2][T_POS_X] = dini_Float(file, "SLOT-2_PosX");
		PlayerToys[playerid][2][T_POS_Y] = dini_Float(file, "SLOT-2_PosY");
		PlayerToys[playerid][2][T_POS_Z] = dini_Float(file, "SLOT-2_PosZ");
		PlayerToys[playerid][2][T_ROT_X] = dini_Float(file, "SLOT-2_RotX");
		PlayerToys[playerid][2][T_ROT_Y] = dini_Float(file, "SLOT-2_RotY");
		PlayerToys[playerid][2][T_ROT_Z] = dini_Float(file, "SLOT-2_RotZ");
		PlayerToys[playerid][2][T_SIZE_X] = dini_Float(file, "SLOT-2_SizeX");
		PlayerToys[playerid][2][T_SIZE_Y] = dini_Float(file, "SLOT-2_SizeY");
		PlayerToys[playerid][2][T_SIZE_Z] = dini_Float(file, "SLOT-2_SizeZ");
		PlayerToys[playerid][2][T_TOGGLE] = dini_Int(file, "SLOT-2_Toggle");
		PlayerToys[playerid][3][T_MODEL] = dini_Int(file, "SLOT-3_Model");
		PlayerToys[playerid][3][T_BONE] = dini_Int(file, "SLOT-3_Bone");
		PlayerToys[playerid][3][T_POS_X] = dini_Float(file, "SLOT-3_PosX");
		PlayerToys[playerid][3][T_POS_Y] = dini_Float(file, "SLOT-3_PosY");
		PlayerToys[playerid][3][T_POS_Z] = dini_Float(file, "SLOT-3_PosZ");
		PlayerToys[playerid][3][T_ROT_X] = dini_Float(file, "SLOT-3_RotX");
		PlayerToys[playerid][3][T_ROT_Y] = dini_Float(file, "SLOT-3_RotY");
		PlayerToys[playerid][3][T_ROT_Z] = dini_Float(file, "SLOT-3_RotZ");
		PlayerToys[playerid][3][T_SIZE_X] = dini_Float(file, "SLOT-3_SizeX");
		PlayerToys[playerid][3][T_SIZE_Y] = dini_Float(file, "SLOT-3_SizeY");
		PlayerToys[playerid][3][T_SIZE_Z] = dini_Float(file, "SLOT-3_SizeZ");
		PlayerToys[playerid][3][T_TOGGLE] = dini_Int(file, "SLOT-3_Toggle");
		PlayerToys[playerid][4][T_MODEL] = dini_Int(file, "SLOT-4_Model");
		PlayerToys[playerid][4][T_BONE] = dini_Int(file, "SLOT-4_Bone");
		PlayerToys[playerid][4][T_POS_X] = dini_Float(file, "SLOT-4_PosX");
		PlayerToys[playerid][4][T_POS_Y] = dini_Float(file, "SLOT-4_PosY");
		PlayerToys[playerid][4][T_POS_Z] = dini_Float(file, "SLOT-4_PosZ");
		PlayerToys[playerid][4][T_ROT_X] = dini_Float(file, "SLOT-4_RotX");
		PlayerToys[playerid][4][T_ROT_Y] = dini_Float(file, "SLOT-4_RotY");
		PlayerToys[playerid][4][T_ROT_Z] = dini_Float(file, "SLOT-4_RotZ");
		PlayerToys[playerid][4][T_SIZE_X] = dini_Float(file, "SLOT-4_SizeX");
		PlayerToys[playerid][4][T_SIZE_Y] = dini_Float(file, "SLOT-4_SizeY");
		PlayerToys[playerid][4][T_SIZE_Z] = dini_Float(file, "SLOT-4_SizeZ");
		PlayerToys[playerid][4][T_TOGGLE] = dini_Int(file, "SLOT-4_Toggle");
		PlayerToys[playerid][5][T_MODEL] = dini_Int(file, "SLOT-5_Model");
		PlayerToys[playerid][5][T_BONE] = dini_Int(file, "SLOT-5_Bone");
		PlayerToys[playerid][5][T_POS_X] = dini_Float(file, "SLOT-5_PosX");
		PlayerToys[playerid][5][T_POS_Y] = dini_Float(file, "SLOT-5_PosY");
		PlayerToys[playerid][5][T_POS_Z] = dini_Float(file, "SLOT-5_PosZ");
		PlayerToys[playerid][5][T_ROT_X] = dini_Float(file, "SLOT-5_RotX");
		PlayerToys[playerid][5][T_ROT_Y] = dini_Float(file, "SLOT-5_RotY");
		PlayerToys[playerid][5][T_ROT_Z] = dini_Float(file, "SLOT-5_RotZ");
		PlayerToys[playerid][5][T_SIZE_X] = dini_Float(file, "SLOT-5_SizeX");
		PlayerToys[playerid][5][T_SIZE_Y] = dini_Float(file, "SLOT-5_SizeY");
		PlayerToys[playerid][5][T_SIZE_Z] = dini_Float(file, "SLOT-5_SizeZ");
		PlayerToys[playerid][5][T_TOGGLE] = dini_Int(file, "SLOT-5_Toggle");
		PlayerToys[playerid][6][T_MODEL] = dini_Int(file, "SLOT-6_Model");
		PlayerToys[playerid][6][T_BONE] = dini_Int(file, "SLOT-6_Bone");
		PlayerToys[playerid][6][T_POS_X] = dini_Float(file, "SLOT-6_PosX");
		PlayerToys[playerid][6][T_POS_Y] = dini_Float(file, "SLOT-6_PosY");
		PlayerToys[playerid][6][T_POS_Z] = dini_Float(file, "SLOT-6_PosZ");
		PlayerToys[playerid][6][T_ROT_X] = dini_Float(file, "SLOT-6_RotX");
		PlayerToys[playerid][6][T_ROT_Y] = dini_Float(file, "SLOT-6_RotY");
		PlayerToys[playerid][6][T_ROT_Z] = dini_Float(file, "SLOT-6_RotZ");
		PlayerToys[playerid][6][T_SIZE_X] = dini_Float(file, "SLOT-6_SizeX");
		PlayerToys[playerid][6][T_SIZE_Y] = dini_Float(file, "SLOT-6_SizeY");
		PlayerToys[playerid][6][T_SIZE_Z] = dini_Float(file, "SLOT-6_SizeZ");
		PlayerToys[playerid][6][T_TOGGLE] = dini_Int(file, "SLOT-6_Toggle");
		PlayerToys[playerid][7][T_MODEL] = dini_Int(file, "SLOT-7_Model");
		PlayerToys[playerid][7][T_BONE] = dini_Int(file, "SLOT-7_Bone");
		PlayerToys[playerid][7][T_POS_X] = dini_Float(file, "SLOT-7_PosX");
		PlayerToys[playerid][7][T_POS_Y] = dini_Float(file, "SLOT-7_PosY");
		PlayerToys[playerid][7][T_POS_Z] = dini_Float(file, "SLOT-7_PosZ");
		PlayerToys[playerid][7][T_ROT_X] = dini_Float(file, "SLOT-7_RotX");
		PlayerToys[playerid][7][T_ROT_Y] = dini_Float(file, "SLOT-7_RotY");
		PlayerToys[playerid][7][T_ROT_Z] = dini_Float(file, "SLOT-7_RotZ");
		PlayerToys[playerid][7][T_SIZE_X] = dini_Float(file, "SLOT-7_SizeX");
		PlayerToys[playerid][7][T_SIZE_Y] = dini_Float(file, "SLOT-7_SizeY");
		PlayerToys[playerid][7][T_SIZE_Z] = dini_Float(file, "SLOT-7_SizeZ");
		PlayerToys[playerid][7][T_TOGGLE] = dini_Int(file, "SLOT-7_Toggle");
	}
	else
	{
		dini_Create(file);
		dini_IntSet(file, "SLOT-0_Model", 0);
		dini_IntSet(file, "SLOT-0_Bone", 1);
		dini_IntSet(file, "SLOT-0_Toggle", 0);
		dini_FloatSet(file, "SLOT-0_PosX", 0.0);
		dini_FloatSet(file, "SLOT-0_PosY", 0.0);
		dini_FloatSet(file, "SLOT-0_PosZ", 0.0);
		dini_FloatSet(file, "SLOT-0_RotX", 0.0);
		dini_FloatSet(file, "SLOT-0_RotY", 0.0);
		dini_FloatSet(file, "SLOT-0_RotZ", 0.0);
		dini_FloatSet(file, "SLOT-0_SizeX", 1.0);
		dini_FloatSet(file, "SLOT-0_SizeY", 1.0);
		dini_FloatSet(file, "SLOT-0_SizeZ", 1.0);
		dini_IntSet(file, "SLOT-1_Model", 0);
		dini_IntSet(file, "SLOT-1_Bone", 1);
		dini_IntSet(file, "SLOT-1_Toggle", 0);
		dini_FloatSet(file, "SLOT-1_PosX", 0.0);
		dini_FloatSet(file, "SLOT-1_PosY", 0.0);
		dini_FloatSet(file, "SLOT-1_PosZ", 0.0);
		dini_FloatSet(file, "SLOT-1_RotX", 0.0);
		dini_FloatSet(file, "SLOT-1_RotY", 0.0);
		dini_FloatSet(file, "SLOT-1_RotZ", 0.0);
		dini_FloatSet(file, "SLOT-1_SizeX", 1.0);
		dini_FloatSet(file, "SLOT-1_SizeY", 1.0);
		dini_FloatSet(file, "SLOT-1_SizeZ", 1.0);
		dini_IntSet(file, "SLOT-2_Model", 0);
		dini_IntSet(file, "SLOT-2_Bone", 1);
		dini_IntSet(file, "SLOT-2_Toggle", 0);
		dini_FloatSet(file, "SLOT-2_PosX", 0.0);
		dini_FloatSet(file, "SLOT-2_PosY", 0.0);
		dini_FloatSet(file, "SLOT-2_PosZ", 0.0);
		dini_FloatSet(file, "SLOT-2_RotX", 0.0);
		dini_FloatSet(file, "SLOT-2_RotY", 0.0);
		dini_FloatSet(file, "SLOT-2_RotZ", 0.0);
		dini_FloatSet(file, "SLOT-2_SizeX", 1.0);
		dini_FloatSet(file, "SLOT-2_SizeY", 1.0);
		dini_FloatSet(file, "SLOT-2_SizeZ", 1.0);
		dini_IntSet(file, "SLOT-3_Model", 0);
		dini_IntSet(file, "SLOT-3_Bone", 1);
		dini_IntSet(file, "SLOT-3_Toggle", 0);
		dini_FloatSet(file, "SLOT-3_PosX", 0.0);
		dini_FloatSet(file, "SLOT-3_PosY", 0.0);
		dini_FloatSet(file, "SLOT-3_PosZ", 0.0);
		dini_FloatSet(file, "SLOT-3_RotX", 0.0);
		dini_FloatSet(file, "SLOT-3_RotY", 0.0);
		dini_FloatSet(file, "SLOT-3_RotZ", 0.0);
		dini_FloatSet(file, "SLOT-3_SizeX", 1.0);
		dini_FloatSet(file, "SLOT-3_SizeY", 1.0);
		dini_FloatSet(file, "SLOT-3_SizeZ", 1.0);
		dini_IntSet(file, "SLOT-4_Model", 0);
		dini_IntSet(file, "SLOT-4_Bone", 1);
		dini_IntSet(file, "SLOT-4_Toggle", 0);
		dini_FloatSet(file, "SLOT-4_PosX", 0.0);
		dini_FloatSet(file, "SLOT-4_PosY", 0.0);
		dini_FloatSet(file, "SLOT-4_PosZ", 0.0);
		dini_FloatSet(file, "SLOT-4_RotX", 0.0);
		dini_FloatSet(file, "SLOT-4_RotY", 0.0);
		dini_FloatSet(file, "SLOT-4_RotZ", 0.0);
		dini_FloatSet(file, "SLOT-4_SizeX", 1.0);
		dini_FloatSet(file, "SLOT-4_SizeY", 1.0);
		dini_FloatSet(file, "SLOT-4_SizeZ", 1.0);
		dini_IntSet(file, "SLOT-5_Model", 0);
		dini_IntSet(file, "SLOT-5_Bone", 1);
		dini_IntSet(file, "SLOT-5_Toggle", 0);
		dini_FloatSet(file, "SLOT-5_PosX", 0.0);
		dini_FloatSet(file, "SLOT-5_PosY", 0.0);
		dini_FloatSet(file, "SLOT-5_PosZ", 0.0);
		dini_FloatSet(file, "SLOT-5_RotX", 0.0);
		dini_FloatSet(file, "SLOT-5_RotY", 0.0);
		dini_FloatSet(file, "SLOT-5_RotZ", 0.0);
		dini_FloatSet(file, "SLOT-5_SizeX", 1.0);
		dini_FloatSet(file, "SLOT-5_SizeY", 1.0);
		dini_FloatSet(file, "SLOT-5_SizeZ", 1.0);
		dini_IntSet(file, "SLOT-6_Model", 0);
		dini_IntSet(file, "SLOT-6_Bone", 1);
		dini_IntSet(file, "SLOT-6_Toggle", 0);
		dini_FloatSet(file, "SLOT-6_PosX", 0.0);
		dini_FloatSet(file, "SLOT-6_PosY", 0.0);
		dini_FloatSet(file, "SLOT-6_PosZ", 0.0);
		dini_FloatSet(file, "SLOT-6_RotX", 0.0);
		dini_FloatSet(file, "SLOT-6_RotY", 0.0);
		dini_FloatSet(file, "SLOT-6_RotZ", 0.0);
		dini_FloatSet(file, "SLOT-6_SizeX", 1.0);
		dini_FloatSet(file, "SLOT-6_SizeY", 1.0);
		dini_FloatSet(file, "SLOT-6_SizeZ", 1.0);
		dini_IntSet(file, "SLOT-7_Model", 0);
		dini_IntSet(file, "SLOT-7_Bone", 1);
		dini_IntSet(file, "SLOT-7_Toggle", 0);
		dini_FloatSet(file, "SLOT-7_PosX", 0.0);
		dini_FloatSet(file, "SLOT-7_PosY", 0.0);
		dini_FloatSet(file, "SLOT-7_PosZ", 0.0);
		dini_FloatSet(file, "SLOT-7_RotX", 0.0);
		dini_FloatSet(file, "SLOT-7_RotY", 0.0);
		dini_FloatSet(file, "SLOT-7_RotZ", 0.0);
		dini_FloatSet(file, "SLOT-7_SizeX", 1.0);
		dini_FloatSet(file, "SLOT-7_SizeY", 1.0);
		dini_FloatSet(file, "SLOT-7_SizeZ", 1.0);

		PlayerToys[playerid][0][T_MODEL] = dini_Int(file, "SLOT-0_Model");
		PlayerToys[playerid][0][T_BONE] = dini_Int(file, "SLOT-0_Bone");
		PlayerToys[playerid][0][T_POS_X] = dini_Float(file, "SLOT-0_PosX");
		PlayerToys[playerid][0][T_POS_Y] = dini_Float(file, "SLOT-0_PosY");
		PlayerToys[playerid][0][T_POS_Z] = dini_Float(file, "SLOT-0_PosZ");
		PlayerToys[playerid][0][T_ROT_X] = dini_Float(file, "SLOT-0_RotX");
		PlayerToys[playerid][0][T_ROT_Y] = dini_Float(file, "SLOT-0_RotY");
		PlayerToys[playerid][0][T_ROT_Z] = dini_Float(file, "SLOT-0_RotZ");
		PlayerToys[playerid][0][T_SIZE_X] = dini_Float(file, "SLOT-0_SizeX");
		PlayerToys[playerid][0][T_SIZE_Y] = dini_Float(file, "SLOT-0_SizeY");
		PlayerToys[playerid][0][T_SIZE_Z] = dini_Float(file, "SLOT-0_SizeZ");
		PlayerToys[playerid][0][T_TOGGLE] = dini_Int(file, "SLOT-0_Toggle");
		PlayerToys[playerid][1][T_MODEL] = dini_Int(file, "SLOT-1_Model");
		PlayerToys[playerid][1][T_BONE] = dini_Int(file, "SLOT-1_Bone");
		PlayerToys[playerid][1][T_POS_X] = dini_Float(file, "SLOT-1_PosX");
		PlayerToys[playerid][1][T_POS_Y] = dini_Float(file, "SLOT-1_PosY");
		PlayerToys[playerid][1][T_POS_Z] = dini_Float(file, "SLOT-1_PosZ");
		PlayerToys[playerid][1][T_ROT_X] = dini_Float(file, "SLOT-1_RotX");
		PlayerToys[playerid][1][T_ROT_Y] = dini_Float(file, "SLOT-1_RotY");
		PlayerToys[playerid][1][T_ROT_Z] = dini_Float(file, "SLOT-1_RotZ");
		PlayerToys[playerid][1][T_SIZE_X] = dini_Float(file, "SLOT-1_SizeX");
		PlayerToys[playerid][1][T_SIZE_Y] = dini_Float(file, "SLOT-1_SizeY");
		PlayerToys[playerid][1][T_SIZE_Z] = dini_Float(file, "SLOT-1_SizeZ");
		PlayerToys[playerid][1][T_TOGGLE] = dini_Int(file, "SLOT-1_Toggle");
		PlayerToys[playerid][2][T_MODEL] = dini_Int(file, "SLOT-2_Model");
		PlayerToys[playerid][2][T_BONE] = dini_Int(file, "SLOT-2_Bone");
		PlayerToys[playerid][2][T_POS_X] = dini_Float(file, "SLOT-2_PosX");
		PlayerToys[playerid][2][T_POS_Y] = dini_Float(file, "SLOT-2_PosY");
		PlayerToys[playerid][2][T_POS_Z] = dini_Float(file, "SLOT-2_PosZ");
		PlayerToys[playerid][2][T_ROT_X] = dini_Float(file, "SLOT-2_RotX");
		PlayerToys[playerid][2][T_ROT_Y] = dini_Float(file, "SLOT-2_RotY");
		PlayerToys[playerid][2][T_ROT_Z] = dini_Float(file, "SLOT-2_RotZ");
		PlayerToys[playerid][2][T_SIZE_X] = dini_Float(file, "SLOT-2_SizeX");
		PlayerToys[playerid][2][T_SIZE_Y] = dini_Float(file, "SLOT-2_SizeY");
		PlayerToys[playerid][2][T_SIZE_Z] = dini_Float(file, "SLOT-2_SizeZ");
		PlayerToys[playerid][2][T_TOGGLE] = dini_Int(file, "SLOT-2_Toggle");
		PlayerToys[playerid][3][T_MODEL] = dini_Int(file, "SLOT-3_Model");
		PlayerToys[playerid][3][T_BONE] = dini_Int(file, "SLOT-3_Bone");
		PlayerToys[playerid][3][T_POS_X] = dini_Float(file, "SLOT-3_PosX");
		PlayerToys[playerid][3][T_POS_Y] = dini_Float(file, "SLOT-3_PosY");
		PlayerToys[playerid][3][T_POS_Z] = dini_Float(file, "SLOT-3_PosZ");
		PlayerToys[playerid][3][T_ROT_X] = dini_Float(file, "SLOT-3_RotX");
		PlayerToys[playerid][3][T_ROT_Y] = dini_Float(file, "SLOT-3_RotY");
		PlayerToys[playerid][3][T_ROT_Z] = dini_Float(file, "SLOT-3_RotZ");
		PlayerToys[playerid][3][T_SIZE_X] = dini_Float(file, "SLOT-3_SizeX");
		PlayerToys[playerid][3][T_SIZE_Y] = dini_Float(file, "SLOT-3_SizeY");
		PlayerToys[playerid][3][T_SIZE_Z] = dini_Float(file, "SLOT-3_SizeZ");
		PlayerToys[playerid][3][T_TOGGLE] = dini_Int(file, "SLOT-3_Toggle");
		PlayerToys[playerid][4][T_MODEL] = dini_Int(file, "SLOT-4_Model");
		PlayerToys[playerid][4][T_BONE] = dini_Int(file, "SLOT-4_Bone");
		PlayerToys[playerid][4][T_POS_X] = dini_Float(file, "SLOT-4_PosX");
		PlayerToys[playerid][4][T_POS_Y] = dini_Float(file, "SLOT-4_PosY");
		PlayerToys[playerid][4][T_POS_Z] = dini_Float(file, "SLOT-4_PosZ");
		PlayerToys[playerid][4][T_ROT_X] = dini_Float(file, "SLOT-4_RotX");
		PlayerToys[playerid][4][T_ROT_Y] = dini_Float(file, "SLOT-4_RotY");
		PlayerToys[playerid][4][T_ROT_Z] = dini_Float(file, "SLOT-4_RotZ");
		PlayerToys[playerid][4][T_SIZE_X] = dini_Float(file, "SLOT-4_SizeX");
		PlayerToys[playerid][4][T_SIZE_Y] = dini_Float(file, "SLOT-4_SizeY");
		PlayerToys[playerid][4][T_SIZE_Z] = dini_Float(file, "SLOT-4_SizeZ");
		PlayerToys[playerid][4][T_TOGGLE] = dini_Int(file, "SLOT-4_Toggle");
		PlayerToys[playerid][5][T_MODEL] = dini_Int(file, "SLOT-5_Model");
		PlayerToys[playerid][5][T_BONE] = dini_Int(file, "SLOT-5_Bone");
		PlayerToys[playerid][5][T_POS_X] = dini_Float(file, "SLOT-5_PosX");
		PlayerToys[playerid][5][T_POS_Y] = dini_Float(file, "SLOT-5_PosY");
		PlayerToys[playerid][5][T_POS_Z] = dini_Float(file, "SLOT-5_PosZ");
		PlayerToys[playerid][5][T_ROT_X] = dini_Float(file, "SLOT-5_RotX");
		PlayerToys[playerid][5][T_ROT_Y] = dini_Float(file, "SLOT-5_RotY");
		PlayerToys[playerid][5][T_ROT_Z] = dini_Float(file, "SLOT-5_RotZ");
		PlayerToys[playerid][5][T_SIZE_X] = dini_Float(file, "SLOT-5_SizeX");
		PlayerToys[playerid][5][T_SIZE_Y] = dini_Float(file, "SLOT-5_SizeY");
		PlayerToys[playerid][5][T_SIZE_Z] = dini_Float(file, "SLOT-5_SizeZ");
		PlayerToys[playerid][5][T_TOGGLE] = dini_Int(file, "SLOT-5_Toggle");
		PlayerToys[playerid][6][T_MODEL] = dini_Int(file, "SLOT-6_Model");
		PlayerToys[playerid][6][T_BONE] = dini_Int(file, "SLOT-6_Bone");
		PlayerToys[playerid][6][T_POS_X] = dini_Float(file, "SLOT-6_PosX");
		PlayerToys[playerid][6][T_POS_Y] = dini_Float(file, "SLOT-6_PosY");
		PlayerToys[playerid][6][T_POS_Z] = dini_Float(file, "SLOT-6_PosZ");
		PlayerToys[playerid][6][T_ROT_X] = dini_Float(file, "SLOT-6_RotX");
		PlayerToys[playerid][6][T_ROT_Y] = dini_Float(file, "SLOT-6_RotY");
		PlayerToys[playerid][6][T_ROT_Z] = dini_Float(file, "SLOT-6_RotZ");
		PlayerToys[playerid][6][T_SIZE_X] = dini_Float(file, "SLOT-6_SizeX");
		PlayerToys[playerid][6][T_SIZE_Y] = dini_Float(file, "SLOT-6_SizeY");
		PlayerToys[playerid][6][T_SIZE_Z] = dini_Float(file, "SLOT-6_SizeZ");
		PlayerToys[playerid][6][T_TOGGLE] = dini_Int(file, "SLOT-6_Toggle");
		PlayerToys[playerid][7][T_MODEL] = dini_Int(file, "SLOT-7_Model");
		PlayerToys[playerid][7][T_BONE] = dini_Int(file, "SLOT-7_Bone");
		PlayerToys[playerid][7][T_POS_X] = dini_Float(file, "SLOT-7_PosX");
		PlayerToys[playerid][7][T_POS_Y] = dini_Float(file, "SLOT-7_PosY");
		PlayerToys[playerid][7][T_POS_Z] = dini_Float(file, "SLOT-7_PosZ");
		PlayerToys[playerid][7][T_ROT_X] = dini_Float(file, "SLOT-7_RotX");
		PlayerToys[playerid][7][T_ROT_Y] = dini_Float(file, "SLOT-7_RotY");
		PlayerToys[playerid][7][T_ROT_Z] = dini_Float(file, "SLOT-7_RotZ");
		PlayerToys[playerid][7][T_SIZE_X] = dini_Float(file, "SLOT-7_SizeX");
		PlayerToys[playerid][7][T_SIZE_Y] = dini_Float(file, "SLOT-7_SizeY");
		PlayerToys[playerid][7][T_SIZE_Z] = dini_Float(file, "SLOT-7_SizeZ");
		PlayerToys[playerid][7][T_TOGGLE] = dini_Int(file, "SLOT-7_Toggle");
	}
	return 1;
}

AttachDarryDerrToys(playerid)
{
	if(PlayerToys[playerid][0][T_MODEL] != 0)
	{
		if(PlayerToys[playerid][0][T_TOGGLE] == 1)
		{
			SetPlayerAttachedObject(playerid,
			0,
			PlayerToys[playerid][0][T_MODEL],
			PlayerToys[playerid][0][T_BONE],
			PlayerToys[playerid][0][T_POS_X],
			PlayerToys[playerid][0][T_POS_Y],
			PlayerToys[playerid][0][T_POS_Z],
			PlayerToys[playerid][0][T_ROT_X],
			PlayerToys[playerid][0][T_ROT_Y],
			PlayerToys[playerid][0][T_ROT_Z],
			PlayerToys[playerid][0][T_SIZE_X],
			PlayerToys[playerid][0][T_SIZE_Y],
			PlayerToys[playerid][0][T_SIZE_Z]);
		}
	}
	if(PlayerToys[playerid][1][T_MODEL] != 0)
	{
		if(PlayerToys[playerid][1][T_TOGGLE] == 1)
		{
			SetPlayerAttachedObject(playerid,
			1,
			PlayerToys[playerid][1][T_MODEL],
			PlayerToys[playerid][1][T_BONE],
			PlayerToys[playerid][1][T_POS_X],
			PlayerToys[playerid][1][T_POS_Y],
			PlayerToys[playerid][1][T_POS_Z],
			PlayerToys[playerid][1][T_ROT_X],
			PlayerToys[playerid][1][T_ROT_Y],
			PlayerToys[playerid][1][T_ROT_Z],
			PlayerToys[playerid][1][T_SIZE_X],
			PlayerToys[playerid][1][T_SIZE_Y],
			PlayerToys[playerid][1][T_SIZE_Z]);
		}
	}
	if(PlayerToys[playerid][2][T_MODEL] != 0)
	{
		if(PlayerToys[playerid][2][T_TOGGLE] == 1)
		{
			SetPlayerAttachedObject(playerid,
			2,
			PlayerToys[playerid][2][T_MODEL],
			PlayerToys[playerid][2][T_BONE],
			PlayerToys[playerid][2][T_POS_X],
			PlayerToys[playerid][2][T_POS_Y],
			PlayerToys[playerid][2][T_POS_Z],
			PlayerToys[playerid][2][T_ROT_X],
			PlayerToys[playerid][2][T_ROT_Y],
			PlayerToys[playerid][2][T_ROT_Z],
			PlayerToys[playerid][2][T_SIZE_X],
			PlayerToys[playerid][2][T_SIZE_Y],
			PlayerToys[playerid][2][T_SIZE_Z]);
		}
	}
	if(PlayerToys[playerid][3][T_MODEL] != 0)
	{
		if(PlayerToys[playerid][3][T_TOGGLE] == 1)
		{
			SetPlayerAttachedObject(playerid,
			3,
			PlayerToys[playerid][3][T_MODEL],
			PlayerToys[playerid][3][T_BONE],
			PlayerToys[playerid][3][T_POS_X],
			PlayerToys[playerid][3][T_POS_Y],
			PlayerToys[playerid][3][T_POS_Z],
			PlayerToys[playerid][3][T_ROT_X],
			PlayerToys[playerid][3][T_ROT_Y],
			PlayerToys[playerid][3][T_ROT_Z],
			PlayerToys[playerid][3][T_SIZE_X],
			PlayerToys[playerid][3][T_SIZE_Y],
			PlayerToys[playerid][3][T_SIZE_Z]);
		}
	}
	if(PlayerToys[playerid][4][T_MODEL] != 0)
	{
		if(PlayerToys[playerid][4][T_TOGGLE] == 1)
		{
			SetPlayerAttachedObject(playerid,
			4,
			PlayerToys[playerid][4][T_MODEL],
			PlayerToys[playerid][4][T_BONE],
			PlayerToys[playerid][4][T_POS_X],
			PlayerToys[playerid][4][T_POS_Y],
			PlayerToys[playerid][4][T_POS_Z],
			PlayerToys[playerid][4][T_ROT_X],
			PlayerToys[playerid][4][T_ROT_Y],
			PlayerToys[playerid][4][T_ROT_Z],
			PlayerToys[playerid][4][T_SIZE_X],
			PlayerToys[playerid][4][T_SIZE_Y],
			PlayerToys[playerid][4][T_SIZE_Z]);
		}
	}
	if(PlayerToys[playerid][5][T_MODEL] != 0)
	{
		if(PlayerToys[playerid][5][T_TOGGLE] == 1)
		{
			SetPlayerAttachedObject(playerid,
			5,
			PlayerToys[playerid][5][T_MODEL],
			PlayerToys[playerid][5][T_BONE],
			PlayerToys[playerid][5][T_POS_X],
			PlayerToys[playerid][5][T_POS_Y],
			PlayerToys[playerid][5][T_POS_Z],
			PlayerToys[playerid][5][T_ROT_X],
			PlayerToys[playerid][5][T_ROT_Y],
			PlayerToys[playerid][5][T_ROT_Z],
			PlayerToys[playerid][5][T_SIZE_X],
			PlayerToys[playerid][5][T_SIZE_Y],
			PlayerToys[playerid][5][T_SIZE_Z]);
		}
	}
	if(PlayerToys[playerid][6][T_MODEL] != 0)
	{
		if(PlayerToys[playerid][6][T_TOGGLE] == 1)
		{
			SetPlayerAttachedObject(playerid,
			5,
			PlayerToys[playerid][6][T_MODEL],
			PlayerToys[playerid][6][T_BONE],
			PlayerToys[playerid][6][T_POS_X],
			PlayerToys[playerid][6][T_POS_Y],
			PlayerToys[playerid][6][T_POS_Z],
			PlayerToys[playerid][6][T_ROT_X],
			PlayerToys[playerid][6][T_ROT_Y],
			PlayerToys[playerid][6][T_ROT_Z],
			PlayerToys[playerid][6][T_SIZE_X],
			PlayerToys[playerid][6][T_SIZE_Y],
			PlayerToys[playerid][6][T_SIZE_Z]);
		}
	}
	if(PlayerToys[playerid][7][T_MODEL] != 0)
	{
		if(PlayerToys[playerid][7][T_TOGGLE] == 1)
		{
			SetPlayerAttachedObject(playerid,
			5,
			PlayerToys[playerid][7][T_MODEL],
			PlayerToys[playerid][7][T_BONE],
			PlayerToys[playerid][7][T_POS_X],
			PlayerToys[playerid][7][T_POS_Y],
			PlayerToys[playerid][7][T_POS_Z],
			PlayerToys[playerid][7][T_ROT_X],
			PlayerToys[playerid][7][T_ROT_Y],
			PlayerToys[playerid][7][T_ROT_Z],
			PlayerToys[playerid][7][T_SIZE_X],
			PlayerToys[playerid][7][T_SIZE_Y],
			PlayerToys[playerid][7][T_SIZE_Z]);
		}
	}
	return 1;
}
