#define ADD_ACT(OBJ,DNAME,SCRIPT,ARGS,PRIO,HIDE) OBJ addAction [DNAME,SCRIPT,ARGS,PRIO,true,HIDE,"","true",5]

[{!isNil "MEU_baseSetupComplete"}, {
    ADD_ACT(tccc,"Open Testing Menu","template\ryan_menu.sqf","init",6,false);
    ADD_ACT(fob_blue_1,"To Lower Deck",MEU_fnc_tpNimitz,nil,6,false);
    ADD_ACT(menu_air,"Air Vehicle Menu","template\menu_air.sqf","init",6,false);
    ADD_ACT(arsenal_0,"Clear Loadout",MEU_fnc_clearLoadout,nil,6,true);
    ADD_ACT(arsenal_1,"Clear Loadout",MEU_fnc_clearLoadout,nil,6,true);
    
    [arsenal_0] call MEU_fnc_addArsenal;
    [arsenal_1] call MEU_fnc_addArsenal;
    
    if (MEU_isTemplate) then {
        ADD_ACT(tccc_1,"Open Mission Menu","template\tccc_menu.sqf","init",6,false);
        ADD_ACT(remoteBuilder,"Build COP Red October","template\tccc_menu.sqf","buildROremote",6,true);
    };
}] call CBA_fnc_waitUntilAndExecute;
