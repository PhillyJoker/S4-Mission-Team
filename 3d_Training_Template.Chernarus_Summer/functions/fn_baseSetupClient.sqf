player removeWeapon "ItemRadio";
["Preload"] call BIS_fnc_arsenal;

[{!isNil "MRB_baseSetupComplete"}, {
    if (!MRB_isTemplate) exitWith {};

    tccc_1 addAction ["Open Mission Menu", "template\tccc_menu.sqf", "init", 6, true, false, "", "true", 5];
    remoteBuilder addAction ["Build COP Red October", "template\tccc_menu.sqf", "buildROremote", 6, true, false, "", "true", 5];
}] call CBA_fnc_waitUntilAndExecute;
