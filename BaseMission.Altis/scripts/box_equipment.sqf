// null = [this] execVM "scripts\box_equipment.sqf";

if (!isServer) exitWith {
    diag_log format [
        "[13th MEU] ERROR: Non-server call to file %1 in mission %2",
         __FILE__, missionName
    ];
};

params ["_box"];

clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

_box addItemCargoGlobal ["ACE_Vector", 50];
_box addItemCargoGlobal ["ACE_MX2A", 50];
_box addItemCargoGlobal ["lerca_1200_black", 50];
_box addItemCargoGlobal ["lerca_1200_tan", 50];
_box addItemCargoGlobal ["Laserdesignator", 5];
_box addItemCargoGlobal ["ItemRadio", 100];
_box addItemCargoGlobal ["ItemSMGR", 10];
_box addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 6];
_box addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 3];
_box addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m993", 3];
_box addMagazineCargoGlobal ["rhs_mag_smaw_HEAA", 2];
_box addMagazineCargoGlobal ["Laserbatteries", 10];
_box addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_HE", 30];
_box addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_Smoke", 10];
_box addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_Illum", 5];
