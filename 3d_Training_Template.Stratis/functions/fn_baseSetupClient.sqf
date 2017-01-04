#define ADD_ACT(OBJ,DNAME,SCRIPT,ARGS,PRIO,HIDE) OBJ addAction [DNAME,SCRIPT,ARGS,PRIO,true,HIDE,"","true",5]

player removeWeapon "ItemRadio";
["Preload"] call BIS_fnc_arsenal;

[{!isNil "MRB_baseSetupComplete"}, {
    if (!MRB_isTemplate) exitWith {};
    ADD_ACT(tccc_1,"Open Mission Menu","template\tccc_menu.sqf","init",6,false);
    ADD_ACT(remoteBuilder,"Build COP Red October","template\tccc_menu.sqf","buildROremote",6,true);
}] call CBA_fnc_waitUntilAndExecute;
