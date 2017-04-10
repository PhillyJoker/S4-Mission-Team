params ["_Vcheck", "_lbData"];

        if (_lbData == "") exitWith {};

private _class = (switch (_Vcheck) do {
    case menu_ground_1: {ground_check_1};
    case menu_ground_2: {ground_check_2};
    case menu_air_1: {air_check_1};
    case menu_air_2: {air_check_2};
});

if (_lbData == "delete_any") exitWith {
    _spCheck = nearestObjects [getPos _class, ["AllVehicles"], 9];
    {deleteVehicle _x} forEach _spCheck;
};

if ((_class distance nearestObject [_class, "AllVehicles"]) <= 5) exitWith {};

private _veh = createVehicle [_lbData, [0, 0, 0], [], 0, "CAN_COLLIDE"];
[_class, _veh, [0, 0, 0], 0, false, true] call BIS_fnc_relPosObject;
_veh setDir (getDir _class);
if (_veh isKindOf "Helicopter") then {
    [_veh] call ace_fastroping_fnc_equipFRIES;
};
