/*
null = [this] execVM "scripts\lav_loadout.sqf";
*/
if (isServer) exitWith {};

params ["_vehicle"];

clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;

// AT
_vehicle addMagazineCargoGlobal ["rhs_mag_smaw_HEAA", 4];
_vehicle addMagazineCargoGlobal ["rhs_mag_smaw_HEDP", 4];

// Ammo
_vehicle addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 30];
_vehicle addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 5];
_vehicle addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m993", 5];
_vehicle addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 8];
_vehicle addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 2];

// Equipment
_vehicle addMagazineCargoGlobal ["SmokeShell", 10];
_vehicle addMagazineCargoGlobal ["SmokeShellGreen", 10];
_vehicle addMagazineCargoGlobal ["SmokeShellYellow", 10];
_vehicle addMagazineCargoGlobal ["HandGrenade", 10];

// Medical
_vehicle addItemCargoGlobal ["ACE_elasticBandage", 60];
_vehicle addItemCargoGlobal ["ACE_quikclot", 60];
_vehicle addItemCargoGlobal ["ACE_packingBandage", 60];
_vehicle addItemCargoGlobal ["ACE_Morphine", 25];
_vehicle addItemCargoGlobal ["ACE_epinephrine", 10];
_vehicle addItemCargoGlobal ["ACE_salineIV_500", 10];
_vehicle addItemCargoGlobal ["ACE_tourniquet", 10];
