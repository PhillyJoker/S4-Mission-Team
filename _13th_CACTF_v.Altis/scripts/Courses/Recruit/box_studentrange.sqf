// 15th MEU(SOC) Rifle Range V5.
// Loadout Script
//
// Place this code in the init.sqf:
// nameofbox addAction ["Shooter Loadout", "scripts\loadouts\loadout_s2.sqf"];
 
if (!local player) exitWith {};

	removeallweapons player;
	removeheadgear player;
	removeVest player;

	player unassignItem "NVgoggles";
	player removeItem "NVGoggles";

	player additem "itemRadio";
	player additem "ACE_Earplugs";
		
	player addWeapon "RHS_WEAP_M16A4_CARRYHANDLE";
	player addMagazine ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
	player addMagazine ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
	player addMagazine ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
	player additem "rhsusf_acc_ACOG2";

	player addheadgear "rhs_Booniehat_marpatwd";
	
	removebackpack player;