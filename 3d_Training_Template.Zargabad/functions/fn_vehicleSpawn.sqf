params ["_infoStand", "_lbData"];

if (_lbData isEqualTo "") exitWith {false};

private _helipad = (switch (_infoStand) do {
    case menu_ground_1: {ground_check_1};
    case menu_ground_2: {ground_check_2};
    case menu_air_1: {air_check_1};
    case menu_air_2: {air_check_2};
});

if (_lbData isEqualTo "delete_any") exitWith {
    private _vehicles = nearestObjects [getPos _helipad, ["AllVehicles"], 9];
    {deleteVehicle _x} forEach _vehicles;
};

if ((_helipad distance nearestObject [_helipad, "AllVehicles"]) <= 5) exitWith {};

private _pos = getPosASL _helipad;
private _veh = createVehicle [_lbData, _pos, [], 0, "CAN_COLLIDE"];
_veh setPosASL _pos;
_veh setDir (getDir _helipad);
