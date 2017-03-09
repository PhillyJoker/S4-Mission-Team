#define RAND (2 + random 1.5) * (selectRandom [-1, 1])
setWind [RAND, RAND, true];
0 setGusts (0.2 + random 0.2);

if (!MRB_isTemplate) exitWith {
    deleteVehicle tccc_1;
    MRB_baseSetupComplete = true;
    publicVariable "MRB_baseSetupComplete";
};

// Gets position of all specialty objects and deletes them
pos_cop_blue = [typeOf cop_blue, getPosASL cop_blue, vectorDir cop_blue, vectorUp cop_blue];
deleteVehicle cop_blue;

pos_menu_ground_2 = [typeOf menu_ground_2, getPosASL menu_ground_2, vectorDir menu_ground_2, vectorUp menu_ground_2];
deleteVehicle menu_ground_2;

pos_ground_check_2 = [typeOf ground_check_2, getPosASL ground_check_2, vectorDir ground_check_2, vectorUp ground_check_2];
deleteVehicle ground_check_2;

pos_arsenal_2 = [typeOf arsenal_2, getPosASL arsenal_2, vectorDir arsenal_2, vectorUp arsenal_2];
deleteVehicle arsenal_2;

pos_equipment_2 = [typeOf equipment_2, getPosASL equipment_2, vectorDir equipment_2, vectorUp equipment_2];
deleteVehicle equipment_2;

pos_remoteBuilder = [typeOf remoteBuilder, getPosASL remoteBuilder, vectorDir remoteBuilder, vectorUp remoteBuilder];
deleteVehicle remoteBuilder;

[{
    private _spCheck = nearestObjects [getMarkerPos "cop_redoctober", [], 200];
    private _spCheckInfo = _spCheck apply {[typeOf _x, getPosASL _x, vectorDir _x, vectorUp _x]};
    {deleteVehicle _x} forEach _spCheck;
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
    private _newMarker = createMarker ["cop_redoctober_no", pos_cop_marker];
    _newMarker setMarkerShape "ICON";
    _newMarker setMarkerType "flag_USA";
    _newMarker setMarkerColor "Default";
    _newMarker = createMarker ["cop_redoctober_text_no", pos_cop_marker];
    _newMarker setMarkerShape "ICON";
    _newMarker setMarkerType "selector_selectable";
    _newMarker setMarkerColor "ColorRed";
    _newMarker setMarkerText "COP Red October (Not Built)";

    MRB_baseSetupComplete = true;
    publicVariable "MRB_baseSetupComplete";
}] call CBA_fnc_execNextFrame;
