if (!isServer) exitWith {
    diag_log format [
        "[13th MEU] ERROR: Non-server call to file %1 in mission %2 - file is marked SERVER_ONLY!",
        __FILE__, missionName
    ]
};

params ["_lav"];

clearMagazineCargoGlobal _lav;
clearBackpackCargoGlobal _lav;
clearWeaponCargoGlobal _lav;
clearItemCargoGlobal _lav;

// AT
_lav addMagazineCargoGlobal ["rhs_mag_smaw_HEAA", 4];
_lav addMagazineCargoGlobal ["rhs_mag_smaw_HEDP", 4];

// Ammo
_lav addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 30];
_lav addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 5];
_lav addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m993", 5];
_lav addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 8];
_lav addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 2];

// Equipment
_lav addMagazineCargoGlobal ["SmokeShell", 10];
_lav addMagazineCargoGlobal ["SmokeShellGreen", 10];
_lav addMagazineCargoGlobal ["SmokeShellYellow", 10];
_lav addMagazineCargoGlobal ["HandGrenade", 10];

// Medical
_lav addItemCargoGlobal ["ACE_elasticBandage", 60];
_lav addItemCargoGlobal ["ACE_quikclot", 60];
_lav addItemCargoGlobal ["ACE_packingBandage", 60];
_lav addItemCargoGlobal ["ACE_Morphine", 25];
_lav addItemCargoGlobal ["ACE_epinephrine", 10];
_lav addItemCargoGlobal ["ACE_salineIV_500", 10];
_lav addItemCargoGlobal ["ACE_tourniquet", 10];
