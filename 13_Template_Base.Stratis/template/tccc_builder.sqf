/*
["buildRO"]execVM "template\tccc_builder.sqf";
["deleteRO"]execVM "template\tccc_builder.sqf";
*/

params ["_build"];
if (_build == "BuildRO") then {
    deleteVehicle remoteBuilder;
    cop_blue = createVehicle [pos_cop_blue select 0, pos_cop_blue select 1, [], 0, "CAN_COLLIDE"];
    cop_blue setPosASL (pos_cop_blue select 1);
    cop_blue setVectorDirAndUp [pos_cop_blue select 2, pos_cop_blue select 3];
    sleep 1;
    [cop_blue, ["To Respawn", MEU_fnc_tp_fob_blue]] remoteExec ["addAction", 0, true];
    publicVariable "cop_blue";

    menu_ground = createVehicle [pos_menu_ground select 0, pos_menu_ground select 1, [], 0, "CAN_COLLIDE"];
    menu_ground setPosASL (pos_menu_ground select 1);
    menu_ground setVectorDirAndUp [pos_menu_ground select 2, pos_menu_ground select 3];
    sleep 1;
    [menu_ground, ["Ground Vehicle Menu", "template\menu_ground.sqf", "init"]] remoteExec ["addAction", 0, true];
    publicVariable "menu_ground";

    ground_check = createVehicle [pos_ground_check select 0, pos_ground_check select 1, [], 0, "CAN_COLLIDE"];
    ground_check setPosASL (pos_ground_check select 1);
    ground_check setVectorDirAndUp [pos_ground_check select 2, pos_ground_check select 3];
    publicVariable "ground_check";

    arsenal_2 = createVehicle [pos_arsenal_2 select 0, pos_arsenal_2 select 1, [], 0, "CAN_COLLIDE"];
    arsenal_2 setPosASL (pos_arsenal_2 select 1);
    arsenal_2 setVectorDirAndUp [pos_arsenal_2 select 2, pos_arsenal_2 select 3];
    [[arsenal_2], MEU_fnc_addArsenal] remoteExec ["call", 0, true];
    sleep 1;
    [arsenal_2, ["Clear Loadout", MEU_fnc_clearLoadout, [], 6, true, true, "", "true", 5]] remoteExec ["addAction", 0, true];
    publicVariable "arsenal_2";

    equipment_2 = createVehicle [pos_equipment_2 select 0, pos_equipment_2 select 1, [], 0, "CAN_COLLIDE"];
    equipment_2 setPosASL (pos_equipment_2 select 1);
    equipment_2 setVectorDirAndUp [pos_equipment_2 select 2, pos_equipment_2 select 3];
    [equipment_2] call MEU_fnc_addEquipment;
    publicVariable "equipment_2";

    {
        private _newObject = createVehicle [_x select 0, _x select 1, [], 0, "CAN_COLLIDE"];
        _newObject setPosASL (_x select 1);
        _newObject setVectorDirAndUp [_x select 2, _x select 3];
    } forEach nearBuildings;

    // Markers
    deleteMarker "cop_redoctober_no";
    deleteMarker "cop_redoctober_text_no";
    private _newMarker = createMarker ['cop_redoctober', pos_cop_marker];
    _newMarker setMarkerShape 'ICON';
    _newMarker setMarkerType 'flag_USA';
    _newMarker setMarkerColor 'Default';
    _newMarker setMarkerAlpha 1;
    _newMarker = createMarker ['cop_redoctober_text', pos_cop_marker];
    _newMarker setMarkerShape 'ICON';
    _newMarker setMarkerType 'selector_selectable';
    _newMarker setMarkerColor 'ColorBlack';
    _newMarker setMarkerAlpha 1;
    _newMarker setMarkerText "COP Red October (Built)";
    [fob_blue, ["To COP Red October", MEU_fnc_tpRedOctober, nil, 5]] remoteExec ["addAction", 0, true];
    [fob_blue_1, ["To COP Red October", MEU_fnc_tpRedOctober, nil, 5]] remoteExec ["addAction", 0, true];
};

if (_build == "deleteRO") then {
    fob_blue remoteExec ["removeAllActions", 0, true];
    fob_blue_1 remoteExec ["removeAllActions", 0, true];
    [fob_blue, ["To Aircraft", MEU_fnc_tp_fob_blue_1]] remoteExec ["addAction", 0, true];
    [fob_blue_1, ["To Respawn", MEU_fnc_tp_fob_blue]] remoteExec ["addAction", 0, true];

    // Delete Special Objects
    deleteVehicle cop_blue;
    deleteVehicle menu_ground;
    deleteVehicle ground_check;
    deleteVehicle arsenal_2;
    deleteVehicle equipment_2;

    // Delete Remaining Objects
    private _spCheck = nearestObjects [getMarkerPos "cop_redoctober", [], 200];
    {deleteVehicle _x} forEach _spCheck;

    //Replace the markers.
    deleteMarker "cop_redoctober";
    deleteMarker "cop_redoctober_text";
    private _newMarker = createMarker ['cop_redoctober_no', pos_cop_marker];
    _newMarker setMarkerShape 'ICON';
    _newMarker setMarkerType 'flag_USA';
    _newMarker setMarkerColor 'Default';
    _newMarker = createMarker ['cop_redoctober_text_no', pos_cop_marker];
    _newMarker setMarkerShape 'ICON';
    _newMarker setMarkerType 'selector_selectable';
    _newMarker setMarkerColor 'ColorRed';
    _newMarker setMarkerText "COP Red October (Not Built)";

    // Rebuild Remote Builder
    remoteBuilder = createVehicle [pos_remoteBuilder select 0, pos_remoteBuilder select 1, [], 0, "CAN_COLLIDE"];
    remoteBuilder setPosASL (pos_remoteBuilder select 1);
    remoteBuilder setVectorDirAndUp [pos_remoteBuilder select 2, pos_remoteBuilder select 3];
    remoteBuilder allowDamage false;
    remoteBuilder setFuel 0;
    publicVariable "remoteBuilder";
    sleep 1;
    [remoteBuilder, ["Build COP Red October", "template\tccc_menu.sqf", "buildROremote"]] remoteExec ["addAction", 0, true];
};
