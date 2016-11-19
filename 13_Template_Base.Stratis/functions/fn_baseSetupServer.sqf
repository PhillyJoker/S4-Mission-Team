_buildList = [
    ["rhsusf_ch53e_usmc", [-30, -80, 17.4]],
    ["rhsusf_ch53e_usmc", [-30, -45, 17.4]],
    ["rhs_ah1z", [28, -118, 17.4], 330],
    ["rhs_ah1z", [27, -135, 17.4], 330],
    ["rhs_uh1y", [-13, -160, 17.4], 35],
    ["rhs_uh1y", [-14, -145, 17.4], 35],
    ["js_jc_fa18e", [20, 45, 17.4], -5],
    ["js_jc_fa18e", [-2, 42, 17.4], -1],
    ["land_infostand_v1_f", [25, -43, 17.4], 0, "menu_air"],
    ["land_infostand_v1_f", [1, -40, 7.2], 180, "tccc_1"],
    ["land_infostand_v1_f", [-1, -40, 7.2], 180, "tccc"],
    ["land_flush_light_yellow_f", [7, -35, 17.4]],
    ["land_flush_light_yellow_f", [9, -35, 17.4]],
    ["land_flush_light_yellow_f", [11, -35, 17.4]],
    ["land_flush_light_yellow_f", [13, -35, 17.4]],
    ["land_flush_light_yellow_f", [15, -35, 17.4]],
    ["land_flush_light_yellow_f", [17, -35, 17.4]],
    ["land_flush_light_yellow_f", [17, -30, 17.4]],
    ["land_flush_light_yellow_f", [17, -25, 17.4]],
    ["land_flush_light_yellow_f", [17, -20, 17.4]],
    ["land_flush_light_yellow_f", [17, -15, 17.4]],
    ["land_flush_light_yellow_f", [17, -10, 17.4]],
    ["land_flush_light_yellow_f", [15, -10, 17.4]],
    ["land_flush_light_yellow_f", [13, -10, 17.4]],
    ["land_flush_light_yellow_f", [11, -10, 17.4]],
    ["land_flush_light_yellow_f", [9, -10, 17.4]],
    ["land_flush_light_yellow_f", [7, -10, 17.4]],
    ["land_flush_light_yellow_f", [7, -15, 17.4]],
    ["land_flush_light_yellow_f", [7, -20, 17.4]],
    ["land_flush_light_yellow_f", [7, -25, 17.4]],
    ["land_flush_light_yellow_f", [7, -30, 17.4]],
    ["land_flush_light_yellow_f", [7, -35, 17.4]],
    ["land_portablelight_double_f", [15, -10, 7.2], 45],
    ["land_portablelight_double_f", [-15, -10, 7.2], -45],
    ["land_portablelight_double_f", [15, -75, 7.2], 135],
    ["land_portablelight_double_f", [-15, -75, 7.2], -135],
    ["land_flush_light_yellow_f", [12, -22.5, 17.4], 0, "air_check"],
    ["flag_us_f", [31, -68, 17.4], 0, "fob_blue_1"],
    ["box_nato_ammoveh_f", [5, -40, 7.2], 0, "arsenal_0"],
    ["box_nato_ammoveh_f", [-5, -40, 7.2], 0, "arsenal_1"],
    ["b_cargonet_01_ammo_f", [10, -40, 7.2], 0, "equipment_0"],
    ["b_cargonet_01_ammo_f", [-10, -40, 7.2], 0, "equipment_1"],
    ["b_slingload_01_ammo_f", [35, -100, 17.4], 0, "resupply_veh"],
    ["b_cargonet_01_ammo_f", [25, -95, 17.4], 0, "resupply_0"],
    ["b_cargonet_01_ammo_f", [25, -105, 17.4], 0, "resupply_0"]
];

_nimitzZ = (getPosASL nimitz_1) select 2;
{
    _x params ["_type", "_pos", ["_dir", 0], ["_name", ""]];
    _veh = createVehicle [_type, [0, 0, 0], [], 0, "CAN_COLLIDE"];

    _localPos = (nimitz_1 worldToModel (getPosASL nimitz_1)) vectorAdd _pos;
    _worldPos = nimitz_1 modelToWorld _localPos;

    _veh setPosASL _worldPos;
    _veh setDir ((getDir nimitz_1) + _dir);

    switch (_type) do {
        case "rhsusf_ch53e_usmc": {_veh animateDoor ["mainRotor_folded", 1, true];};
        case "rhs_uh1y": {[_veh] call ace_fastroping_fnc_equipFRIES;};
    };

    if (_name != "") then {
        if (_name == "resupply_0") exitWith {
            [_veh] call MEU_fnc_addResupply;
        };
        if (_name in ["equipment_0", "equipment_1"]) then {
            [_veh] call MEU_fnc_addEquipment;
        };

        missionNamespace setVariable [_name, _veh, true];
    };
} forEach _buildList;

if (!MEU_isTemplate) exitWith {
    deleteVehicle tccc_1;
    MEU_baseSetupComplete = true;
    publicVariable "MEU_baseSetupComplete";
};

// Gets position of all specialty objects and deletes them
pos_cop_blue = [typeOf cop_blue, getPosASL cop_blue, vectorDir cop_blue, vectorUp cop_blue];
deleteVehicle cop_blue;

pos_menu_ground = [typeOf menu_ground, getPosASL menu_ground, vectorDir menu_ground, vectorUp menu_ground];
deleteVehicle menu_ground;

pos_ground_check = [typeOf ground_check, getPosASL ground_check, vectorDir ground_check, vectorUp ground_check];
deleteVehicle ground_check;

pos_arsenal_2 = [typeOf arsenal_2, getPosASL arsenal_2, vectorDir arsenal_2, vectorUp arsenal_2];
deleteVehicle arsenal_2;

pos_equipment_2 = [typeOf equipment_2, getPosASL equipment_2, vectorDir equipment_2, vectorUp equipment_2];
deleteVehicle equipment_2;

pos_remoteBuilder = [typeOf remoteBuilder, getPosASL remoteBuilder, vectorDir remoteBuilder, vectorUp remoteBuilder];
deleteVehicle remoteBuilder;

_spCheck = nearestObjects [getMarkerPos "cop_redoctober", [], 200];
{deleteVehicle _x} forEach _spCheck;
_spCheckInfo = _spCheck apply {[typeOf _x, getPosASL _x, vectorDir _x, vectorUp _x]};
nearBuildings = _spCheckInfo select {(_x select 0) != ""};
publicVariable "nearBuildings";

// Rebuild Remote Builder
remoteBuilder = createVehicle [pos_remoteBuilder select 0, pos_remoteBuilder select 1, [], 0, "CAN_COLLIDE"];
remoteBuilder setPosASL (pos_remoteBuilder select 1);
remoteBuilder setVectorDirAndUp [pos_remoteBuilder select 2, pos_remoteBuilder select 3];
remoteBuilder allowDamage false;
remoteBuilder setFuel 0;
publicVariable "remoteBuilder";

// Replace the markers.
pos_cop_marker = getMarkerPos "cop_redoctober";
deleteMarker "cop_redoctober";
_newMarker = createMarker ["cop_redoctober_no", pos_cop_marker];
_newMarker setMarkerShape "ICON";
_newMarker setMarkerType "flag_USA";
_newMarker setMarkerColor "Default";
_newMarker = createMarker ["cop_redoctober_text_no", pos_cop_marker];
_newMarker setMarkerShape "ICON";
_newMarker setMarkerType "selector_selectable";
_newMarker setMarkerColor "ColorRed";
_newMarker setMarkerText "COP Red October (Not Built)";

MEU_baseSetupComplete = true;
publicVariable "MEU_baseSetupComplete";
