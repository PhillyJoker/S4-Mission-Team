[{!isNil "MEU_isTemplate"}, {
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

    [{
        private _spCheck = nearestObjects [getMarkerPos "cop_redoctober", [], 200];
        private _spCheckInfo = _spCheck apply {[typeOf _x, getPosASL _x, vectorDir _x, vectorUp _x]};
        {deleteVehicle _x} forEach _spCheck;
        nearBuildings = _spCheckInfo select {!((_x select 0) isEqualTo "")};
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

        MEU_baseSetupComplete = true;
        publicVariable "MEU_baseSetupComplete";
    }] call CBA_fnc_execNextFrame;
}] call CBA_fnc_waitUntilAndExecute;
