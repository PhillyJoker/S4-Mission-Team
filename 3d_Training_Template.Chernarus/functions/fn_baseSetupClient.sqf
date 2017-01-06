#define ADD_ACT(OBJ,DNAME,ARGS) OBJ addAction [DNAME,"template\tccc_menu.sqf",ARGS,6,true,false,"","true",5]

player removeWeapon "ItemRadio";
["Preload"] call BIS_fnc_arsenal;

[{!isNil "MRB_baseSetupComplete"}, {
    if (!MRB_isTemplate) exitWith {};
    ADD_ACT(tccc_1,"Open Mission Menu","init");
    ADD_ACT(remoteBuilder,"Build COP Red October","buildROremote");
}] call CBA_fnc_waitUntilAndExecute;
