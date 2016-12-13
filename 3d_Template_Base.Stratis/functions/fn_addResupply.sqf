#include "\mrb_mod\script_component.hpp"

SERVER_ONLY;

params ["_box"];

clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

// AT
_box addWeaponCargoGlobal ["rhs_weap_M136_hp", 2];
_box addMagazineCargoGlobal ["rhs_mag_smaw_HEAA", 3];

// Ammo
_box addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 100];
_box addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 40];
_box addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 20];
_box addMagazineCargoGlobal ["rhs_mag_M433_HEDP", 12];
_box addMagazineCargoGlobal ["rhs_mag_M441_HE", 12];

// Equipment
_box addMagazineCargoGlobal ["SmokeShell", 40];
_box addMagazineCargoGlobal ["SmokeShellGreen", 20];
_box addMagazineCargoGlobal ["HandGrenade", 20];

//Mortars
_box addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_HE", 20];
_box addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_Smoke", 5];

// Medical
_box addItemCargoGlobal ["ACE_elasticBandage", 200];
_box addItemCargoGlobal ["ACE_quikclot", 200];
_box addItemCargoGlobal ["ACE_packingBandage", 200];
_box addItemCargoGlobal ["ACE_Morphine", 20];
_box addItemCargoGlobal ["ACE_epinephrine", 20];
_box addItemCargoGlobal ["ACE_salineIV_500", 10];
