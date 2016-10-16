waituntil {! isnull player};

//Remove all gear from player and add what is needed
if (player == player) then {
 
    removeallweapons player;
    removeallassigneditems player;
    removevest player;
    removebackpack player;
    removeheadgear player;
    removegoggles player;
	removeUniform player;
	player forceAddUniform "rhs_uniform_FROG01_wd";
	player additem "ItemMap";
	player assignItem "ItemMap";
		view = player addAction ["Settings", "scripts\Client\Viewdistance.sqf", [],-99,false,false];

 } else {};
 
/*
 RCT Instructors
	"B_medic_F"
 ITB Instructors
	"B_recon_medic_F"
 MCT Intructor
	"B_CTRG_soldier_M_medic_F"
 FMTB Instructors
	"rhsusf_navy_sarc_w"
 Weapons Instructors
	"rhsusf_navy_marpat_d_medic"
 Flight Instructors
	"rhsusf_usmc_marpat_wd_helicrew"
 CPLC/SGTC Instructors
	"rhsusf_navy_sarc_d"
*/

	if (player iskindof "B_medic_F") then {
	// RCT Instructors
		[player,"RRCourse"] call BIS_fnc_addCommMenuItem;
	};
 
	if (player iskindof "B_recon_medic_F") then {
	// ITB Instructors
		[player,"ATMGCourse"] call BIS_fnc_addCommMenuItem;
		[player,"BAMCourse"] call BIS_fnc_addCommMenuItem;
		[player,"GrenadeCourse"] call BIS_fnc_addCommMenuItem;
		[player,"IDCourse"] call BIS_fnc_addCommMenuItem;
		[player,"MOUTCourse"] call BIS_fnc_addCommMenuItem;
		[player,"FormationsCourse"] call BIS_fnc_addCommMenuItem;
		[player,"VehicleWeaponsCourse"] call BIS_fnc_addCommMenuItem;
	};
	
	if (player iskindof "B_CTRG_soldier_M_medic_F") then {
	// MCT Intructors
		[player,"ATMGCourse"] call BIS_fnc_addCommMenuItem;
		[player,"BAMCourse"] call BIS_fnc_addCommMenuItem;
		[player,"GrenadeCourse"] call BIS_fnc_addCommMenuItem;
		[player,"IDCourse"] call BIS_fnc_addCommMenuItem;
		[player,"MOUTCourse"] call BIS_fnc_addCommMenuItem;
		[player,"RRCourse"] call BIS_fnc_addCommMenuItem;
	};
	
	if (player iskindof "rhsusf_navy_marpat_d_medic") then {
	// Weapons Intructors
		[player,"ATMGCourse"] call BIS_fnc_addCommMenuItem;
		[player,"BAMCourse"] call BIS_fnc_addCommMenuItem;
		[player,"GrenadeCourse"] call BIS_fnc_addCommMenuItem;
		[player,"IDCourse"] call BIS_fnc_addCommMenuItem;
		[player,"MOUTCourse"] call BIS_fnc_addCommMenuItem;
		[player,"RRCourse"] call BIS_fnc_addCommMenuItem;
		[player,"FormationsCourse"] call BIS_fnc_addCommMenuItem;
		[player,"VehicleWeaponsCourse"] call BIS_fnc_addCommMenuItem;
	};

	if ((player iskindof "rhsusf_usmc_marpat_wd_squadleader") ||
		(player iskindof "rhsusf_usmc_marpat_wd_officer")) then {
	// Squad Leaders
		[player,"ATMGCourse"] call BIS_fnc_addCommMenuItem;
		[player,"BAMCourse"] call BIS_fnc_addCommMenuItem;
		[player,"GrenadeCourse"] call BIS_fnc_addCommMenuItem;
		[player,"IDCourse"] call BIS_fnc_addCommMenuItem;
		[player,"MOUTCourse"] call BIS_fnc_addCommMenuItem;
		[player,"RRCourse"] call BIS_fnc_addCommMenuItem;
		[player,"FormationsCourse"] call BIS_fnc_addCommMenuItem;
		[player,"VehicleWeaponsCourse"] call BIS_fnc_addCommMenuItem;
	};

	if (player iskindof "rhsusf_usmc_marpat_wd_helicrew") then {
	// Flight School
		[player,"LIVEFIREAREA"] call BIS_fnc_addCommMenuItem;
	};
	
// This is possibly an inheritance class, causing issues.
	if ((player iskindof "rhsusf_usmc_marpat_d_rifleman_m4") || (player iskindof "b_medic_f")) then {

		player addEventHandler ["Fired", {_this call meu_Func_checkAmmo;_this call meu_Func_addShotCount;}];
		
		// Legacy
		//player addEventHandler ["Reloaded", {player addMagazine ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 5];}]; 
		//player addEventHandler ["Fired", {_this call meu_Func_addShotCount;}];

	};


/* Admin Commands, Only 10 allowed until I can get the sub menu to work.
	if (serverCommandAvailable "#kick") then {

		[player,"ATMGCourse"] call BIS_fnc_addCommMenuItem;
		[player,"BAMCourse"] call BIS_fnc_addCommMenuItem;
		[player,"GrenadeCourse"] call BIS_fnc_addCommMenuItem;
		[player,"IDCourse"] call BIS_fnc_addCommMenuItem;
		[player,"FormCourse"] call BIS_fnc_addCommMenuItem;
		[player,"MOUTCourse"] call BIS_fnc_addCommMenuItem;
		[player,"GBUMAV"] call BIS_fnc_addCommMenuItem;
		[player,"GAUFFAR"] call BIS_fnc_addCommMenuItem;
		[player,"TACPHILL"] call BIS_fnc_addCommMenuItem;
	};
*/

// Wait until player is initialized
if (!isDedicated) then {waitUntil {!isNull player && isPlayer player};};

sleep 1;
// All Billboards Spawned here
	// Welcome Board ITB
		sign2 setObjectTexture [0, "pics\slides\WelcomeBoard.jpg"];
			Sleep 1;
	// Welcome Board Flight School
		sign1 setObjectTexture [0, "pics\slides\WelcomeBoard.jpg"];
			Sleep 1;
	// Classroom Board Flight School
		sign_2 setObjectTexture [0, "pics\slides\WelcomeBoard.jpg"];
			Sleep 1;
	// Classroom Board ITB
		sign_1 setObjectTexture [0, "pics\slides\WelcomeBoard.jpg"];	

sleep 2;

// Flag_1 = Terminal
// Flag_2 = Military Complex - Removed
// Flag_3 = Army Staging Area
// Flag_4 = West Annex
// Flag_5 = Flight School
// Flag_6 = Range Complex Two
// Flag_7 = JTAC Hill
// Flag_8 = Range Complex One

// Flag Teleports
	Flag_1 addAction ["Range Complex One","Scripts\Client\Teleport.sqf",["Tele_Range_One"]];
	Flag_1 addAction ["Range Complex Two","Scripts\Client\Teleport.sqf",["Tele_Range_Two"]];
	Flag_1 addAction ["West Annex","Scripts\Client\Teleport.sqf",["Tele_LandNav"]];
	Flag_1 addAction ["Flight School","Scripts\Client\Teleport.sqf",["Tele_Flight"]];
	Flag_1 addAction ["USMC Staging Area","Scripts\Client\Teleport.sqf",["Tele_Staging"]];
	Flag_1 addAction ["Carrier","Scripts\Client\TeleportSea.sqf",["Tele_Nimitz"]];
	Flag_1 addAction ["JTAC Hill","Scripts\Client\Teleport.sqf",["Tele_JTAC"]];
	
	
	Flag_3 addAction ["Terminal","Scripts\Client\Teleport.sqf",["Tele_Terminal"]];
	Flag_4 addAction ["Terminal","Scripts\Client\Teleport.sqf",["Tele_Terminal"]];
	Flag_5 addAction ["Terminal","Scripts\Client\Teleport.sqf",["Tele_Terminal"]];
	Flag_5 addAction ["Carrier","Scripts\Client\TeleportSea.sqf",["Tele_Nimitz"]];
	Flag_5 addAction ["JTAC Hill","Scripts\Client\Teleport.sqf",["Tele_JTAC"]];
	Flag_6 addAction ["Terminal","Scripts\Client\Teleport.sqf",["Tele_Terminal"]];
	Flag_7 addAction ["Terminal","Scripts\Client\Teleport.sqf",["Tele_Terminal"]];
	Flag_8 addAction ["Terminal","Scripts\Client\Teleport.sqf",["Tele_Terminal"]];
	
sleep 2;

 [] execVM "scripts\Client\Load_Actions.sqf";
 
execVM "scripts\Client\Ground_List.sqf";
execVM "scripts\Client\Air_List.sqf";

player setVariable ["meuRangeShotCount", 0,true];

