/*
In the initServer.sqf:
[] execVM "template\base_setup.sqf";
*/

if (isServer) then {
    _b_list = [
        ["rhsusf_ch53e_usmc", [-30, -80, 17.5], 0],
        ["rhsusf_ch53e_usmc", [-30, -45, 17.5], 0],
        ["rhs_ah1z", [28, -118, 17.5], 330],
        ["rhs_ah1z", [27, -135, 17.5], 330],
        ["rhs_uh1y", [-13, -160, 17.5], 35],
        ["rhs_uh1y", [-14, -145, 17.5], 35],
        ["js_jc_fa18e", [20, 45, 17.5], -5],
        ["js_jc_fa18e", [-2, 42, 17.5], -1],
        ["land_infostand_v1_f", [25, -43, 17.5], 0, "menu_air"],
        ["land_infostand_v1_f", [1, -40, 7], 180, "menu_build"],
        ["land_infostand_v1_f", [-1, -40, 7], 180, "menu_hc"],
        ["land_flush_light_yellow_f", [7, -35, 17.4], 0],
        ["land_flush_light_yellow_f", [9, -35, 17.4], 0],
        ["land_flush_light_yellow_f", [11, -35, 17.4], 0],
        ["land_flush_light_yellow_f", [13, -35, 17.4], 0],
        ["land_flush_light_yellow_f", [15, -35, 17.4], 0],
        ["land_flush_light_yellow_f", [17, -35, 17.4], 0],
        ["land_flush_light_yellow_f", [17, -30, 17.4], 0],
        ["land_flush_light_yellow_f", [17, -25, 17.4], 0],
        ["land_flush_light_yellow_f", [17, -20, 17.4], 0],
        ["land_flush_light_yellow_f", [17, -15, 17.4], 0],
        ["land_flush_light_yellow_f", [17, -10, 17.4], 0],
        ["land_flush_light_yellow_f", [15, -10, 17.4], 0],
        ["land_flush_light_yellow_f", [13, -10, 17.4], 0],
        ["land_flush_light_yellow_f", [11, -10, 17.4], 0],
        ["land_flush_light_yellow_f", [9, -10, 17.4], 0],
        ["land_flush_light_yellow_f", [7, -10, 17.4], 0],
        ["land_flush_light_yellow_f", [7, -15, 17.4], 0],
        ["land_flush_light_yellow_f", [7, -20, 17.4], 0],
        ["land_flush_light_yellow_f", [7, -25, 17.4], 0],
        ["land_flush_light_yellow_f", [7, -30, 17.4], 0],
        ["land_flush_light_yellow_f", [7, -35, 17.4], 0],
        ["land_portablelight_double_f", [15, -10, 7], 45],
        ["land_portablelight_double_f", [-15, -10, 7], -45],
        ["land_portablelight_double_f", [15, -75, 7], 135],
        ["land_portablelight_double_f", [-15, -75, 7], -135],
        ["land_flush_light_yellow_f", [12, -22.5, 17.4], 0, "air_check"],
        ["flag_us_f", [31, -68, 17.5], 0, "tp_f_1"],
        ["box_nato_ammoveh_f", [5, -40, 7.1], 0, "arsenal_0"],
        ["box_nato_ammoveh_f", [-5, -40, 7.1], 0, "arsenal_00"],
        ["b_cargonet_01_ammo_f", [10, -40, 7], 0, "equipment_0"],
        ["b_cargonet_01_ammo_f", [-10, -40, 7], 0, "equipment_00"],
        ["b_slingload_01_ammo_f", [35, -100, 17.5], 0, "resupply_veh"],
        ["b_cargonet_01_ammo_f", [25, -95, 17.5], 0, "resupply_0"],
        ["b_cargonet_01_ammo_f", [25, -105, 17.5], 0, "resupply_0"]
    ];

    _n_pos_z = (getPosASL nimitz_1) select 2;
    {
        _x params ["_type", "_pos", "_dir", "_name"];
        temp_obj = createVehicle [_type, [0, 0, 0], [], 0, "CAN_COLLIDE"];
        [nimitz_1, temp_obj, _pos, _dir] call BIS_fnc_relPosObject;
        _obj_rel = getPosASL temp_obj;
        temp_obj setPosASL (_obj_rel vectorAdd [0, 0, _n_pos_z]);

        switch (_type) do {
            case "rhsusf_ch53e_usmc": {temp_obj animateDoor ["mainRotor_folded", 1, true];};
            case "rhs_uh1y": {[temp_obj] call ace_fastroping_fnc_equipFRIES;};
        };

        if (_name == "resupply_0") exitWith {
            [temp_obj] execVM "scripts\box_resupply.sqf";
        };

        call compile format ["'%1' = %2; publicVariable '%2';", _name, temp_obj];
    } forEach _b_list;
    temp_obj = nil;

    // Gets position of all specialty objects and deletes them
    pos_cop_blue = [typeOf cop_blue, getPosASL cop_blue, getPosASL cop_blue, vectorDir cop_blue, vectorUp cop_blue];
    deleteVehicle cop_blue;

    pos_menu_ground = [typeOf menu_ground, getPosASL menu_ground, getPosASL menu_ground, vectorDir menu_ground, vectorUp menu_ground];
    deleteVehicle menu_ground;

    pos_ground_check = [typeOf ground_check, getPosASL ground_check, getPosASL ground_check, vectorDir ground_check, vectorUp ground_check];
    deleteVehicle ground_check;

    pos_arsenal_1 = [typeOf arsenal_1, getPosASL arsenal_1, getPosASL arsenal_1, vectorDir arsenal_1, vectorUp arsenal_1];
    deleteVehicle arsenal_1;

    pos_equipment_1 = [typeOf equipment_1, getPosASL equipment_1, getPosASL equipment_1, vectorDir equipment_1, vectorUp equipment_1];
    deleteVehicle equipment_1;

    pos_remoteBuilder = [typeOf remoteBuilder, getPosASL remoteBuilder, getPosASL remoteBuilder, vectorDir remoteBuilder, vectorUp remoteBuilder];
    deleteVehicle remoteBuilder;

    pos_cop_marker = getMarkerPos "cop_redoctober";

    //Get all objects within 200m of the COP then save & delete them.
    building_array = [];
    _spCheck = nearestObjects [getMarkerPos "cop_redoctober", [], 200];
    aresmod addCuratorEditableObjects [_spCheck, false];
    _sp2Check = curatorEditableObjects aresmod;
    {
        _tempArr = [typeOf _x, getPosASL _x, getPosASL _x, vectorDir _x, vectorUp _x];
        building_array pushback _tempArr;
    } forEach _sp2Check;

    {deleteVehicle _x} forEach _sp2Check;

    //Rebuild Remote Builder
    remoteBuilder = createVehicle [pos_remoteBuilder select 0, pos_remoteBuilder select 1, [], 0, "CAN_COLLIDE"];
    remoteBuilder setPosASL (pos_remoteBuilder select 2);
    remoteBuilder setVectorDirAndUp [pos_remoteBuilder select 3, pos_remoteBuilder select 4];

    //Replace the markers.
    deleteMarker "cop_redoctober";
    deleteMarker "cop_redoctober_text";
    _newMarker = createMarker ["cop_redoctober_no", pos_cop_marker];
    _newMarker setMarkerShape "ICON";
    _newMarker setMarkerType "flag_USA";
    _newMarker setMarkerDir 0;
    _newMarker setMarkerColor "Default";
    _newMarker setMarkerAlpha 1;
    _newMarker = createMarker ["cop_redoctober_text_no", pos_cop_marker];
    _newMarker setMarkerShape "ICON";
    _newMarker setMarkerType "selector_selectable";
    _newMarker setMarkerDir 0;
    _newMarker setMarkerColor "ColorRed";
    _newMarker setMarkerAlpha 1;
    _newMarker setMarkerText "COP Red October (Not Built)";
};

menu_air addAction ["Air Vehicle Menu", "template\menu_air.sqf", "init"];
tccc addAction ["Open Testing Menu", "template\ryan_menu.sqf", "init"];
tccc_1 addAction ["Open Mission Menu", "template\tccc_menu.sqf", "init"];
fob_blue_1 addAction ["To COP Red October", "template\tpto_cop_blue.sqf"];
fob_blue_1 addAction ["To Lower Deck", "template\tpto_fob_blue.sqf"];
arsenal_0 addAction ["Clear Loadout", "scripts\clear_loadout.sqf", [], 6, true, true, "", "true", 5];
arsenal_00 addAction ["Clear Loadout", "scripts\clear_loadout.sqf", [], 6, true, true, "", "true", 5];
[arsenal_0] execVM "scripts\box_virtualarsenal.sqf";
[arsenal_00] execVM "scripts\box_virtualarsenal.sqf";
[equipment_0] execVM "scripts\box_equipment.sqf";
[equipment_00] execVM "scripts\box_equipment.sqf";
[remoteBuilder, ["Build COP Red October", "template\tccc_menu.sqf", "buildROremote"]] remoteExec ["addAction", 0, true];
remoteBuilder allowDamage false;
remoteBuilder setFuel 0;
