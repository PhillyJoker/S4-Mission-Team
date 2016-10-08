// 15th MEU(SOC) Rifle Range V5.
// Loadout Script
//
// Place this code in the init.sqf.
// nameofbox addAction ["Range Staff Loadout", "scripts\loadouts\loadout_rm2.sqf"];
 
 
if (!local player) exitWith {};

	removeallweapons player;
	removeheadgear player;
	removeVest player;
	
	

	player unassignItem "NVgoggles";
	player removeItem "NVGoggles";

	player additem "ACE_Earplugs";
	
	player addweapon "ACE_Vector";
	player assignitem "ACE_Vector";

	player additem "itemRadio";

	player addheadgear "H_Cap_headphones";
	player addVest "V_Rangemaster_belt";
	
	player addWeapon "hgun_ACPC2_F";	
	player addSecondaryWeaponItem "9Rnd_45ACP_Mag";
	player addMagazines ["9Rnd_45ACP_Mag", 2];
	
	
	removebackpack player;