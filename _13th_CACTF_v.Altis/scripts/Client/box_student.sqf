_crate = _this select 0;
["AmmoboxInit",[_crate,false,{true}]] spawn BIS_fnc_arsenal;
 
//Lists of items to include
_availableHeadgear = [
	"rhsusf_ach_helmet_ocp"
];
 
_availableGoggles = [
	"rhs_googles_clear",
	"rhs_googles_orange",
	"rhs_googles_yellow",
	"rhs_googles_black"
];
 
_availableUniforms = [
	"rhs_uniform_cu_ocp_101st"
];
 
_availableVests = [
	"rhsusf_iotv_ocp_Grenadier",
	"rhsusf_iotv_ocp_Medic",
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ocp_SAW",
	"rhsusf_iotv_ocp_Teamleader"
];
 
_availableBackpacks = [
	"rhsusf_assault_eagleaiii_ocp",
	"506th_assault_eagleaiii_coy_Medic"
];
 
_availableItems = [
	"rhsusf_ANPVS_14",
	"rhsusf_ANPVS_15",
	"rhsusf_ANPVS_14_full",
	"rhsusf_ANPVS_15_full",
	"rhsusf_ANPVS_14_oval",
	"rhsusf_ANPVS_14_full_ng",
	"rhsusf_ANPVS_14_oval_ng",
	"rhsusf_ANPVS_15_full_ng",
	"rhsusf_ANPVS_15_ng",
	"ItemWatch",
	"ItemCompass",
	"ItemGPS",
	"ItemMap",
	"ToolKit",
	"ACE_Clacker",
	"ACE_DefusalKit",
	"ACE_wirecutter",
	"ACE_EarPlugs",
	"ACE_CableTie",
	"ACE_MapTools",	
	"ACE_fieldDressing",
	"ACE_Morphine",
	"ACE_epinephrine",
	"ACE_bloodIV_250",
	"ACE_microDAGR_Item",
	"ItemSMGR"
];

_availableAccessories = [
	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_anpeq15",
	"rhsusf_acc_anpeq15A",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_compm4",
	"rhsusf_acc_ELCAN",
	"tf47_optic_m3maaws"
];
 
_availableMagazines = [
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag_Tracer_Red",
	"rhsusf_100Rnd_556x45_soft_pouch",
	"RH_15Rnd_9x19_M9",
	"rhs_fgm148_magazine_AT",
	"tf47_m3maaws_heat",
	"rhs_mag_M433_HEDP",
	"rhs_mag_M441_HE",
	"rhs_mag_M4009",
	"rhs_mag_m576",
	"rhs_mag_M585_white",
	"rhs_mag_M661_green",
	"rhs_mag_M662_red",
	"rhs_mag_M713_red",
	"rhs_mag_M714_white",
	"rhs_mag_M715_green",
	"rhs_mag_M716_yellow",
	"rhs_m136_mag"
];

_availableGrenades = [ 
	"DemoCharge_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"SmokeShell",
	"SmokeShellRed",
	"SmokeShellGreen",
	"SmokeShellYellow",
	"SmokeShellPurple",
	"SmokeShellBlue",
	"SmokeShellOrange",
	"rhs_mag_mk84",
	"HandGrenade",
	"Chemlight_green"
];

_availableWeapons = [
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1",
	"rhs_weap_m4a1_m320",
	"rhs_weap_m249_pip_L",
	"rhs_weap_M136",
	"tf47_m3maaws",
	"rhs_weap_fgm148",
	"RH_m9",
	"Binocular"
];
 
// Populate with predefined items and whatever is already in the crate
[_crate,((backpackCargo _crate) + _availableBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
[_crate,((itemCargo _crate) + _availableHeadgear + _availableGoggles + _availableUniforms + _availableVests + _availableItems + _availableAccessories)] call BIS_fnc_addVirtualItemCargo;
[_crate,((magazineCargo _crate) + _availableMagazines + _availableGrenades)] call BIS_fnc_addVirtualMagazineCargo;
[_crate,((weaponCargo _crate) + _availableWeapons)] call BIS_fnc_addVirtualWeaponCargo;