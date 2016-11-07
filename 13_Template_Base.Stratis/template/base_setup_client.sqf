#define ADD_ACT(OBJ,DNAME,SCRIPT,ARGS,PRIO,HIDE) OBJ addAction [DNAME,SCRIPT,ARGS,PRIO,true,HIDE,"","true",5]

waitUntil {!isNil "MEU_baseSetupComplete"};

ADD_ACT(tccc,"Open Testing Menu","template\ryan_menu.sqf","init",6,false);
ADD_ACT(tccc_1,"Open Mission Menu","template\tccc_menu.sqf","init",6,false);
ADD_ACT(fob_blue_1,"To COP Red October","template\tpto_cop_blue.sqf",nil,6,true);
ADD_ACT(fob_blue_1,"To Lower Deck","template\tpto_fob_blue.sqf",nil,5,true);
ADD_ACT(menu_air,"Air Vehicle Menu","template\menu_air.sqf","init",6,false);
ADD_ACT(remoteBuilder,"Build COP Red October","template\tccc_menu.sqf","buildROremote",6,true);
ADD_ACT(arsenal_0,"Clear Loadout","scripts\clear_loadout.sqf",nil,6,true);
ADD_ACT(arsenal_1,"Clear Loadout","scripts\clear_loadout.sqf",nil,6,true);

[arsenal_0] execVM "scripts\box_virtualarsenal.sqf";
[arsenal_1] execVM "scripts\box_virtualarsenal.sqf";
