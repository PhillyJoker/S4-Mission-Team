params ["_object"];

private _type = typeOf _object;

private _reloadTimeFactor = 2.8;

_object setVehicleAmmo 1;
_object vehicleChat format ["Servicing %1... Please stand by...", _type];

private _magazines = getArray (configFile >> "CfgVehicles" >> _type >> "magazines");

if !(_magazines isEqualTo []) then {
    {
        _object removeMagazines _x;
    } forEach (_magazines arrayIntersect _magazines);
    {
        _object vehicleChat format ["Reloading %1", _x];
        sleep _reloadTimeFactor;
        _object addMagazine _x;
    } forEach _magazines;
};

private _count = count (configFile >> "CfgVehicles" >> _type >> "turrets");

if (_count > 0) then {
    for "_i" from 0 to (_count - 1) do {
        _config = (configFile >> "CfgVehicles" >> _type >> "turrets") select _i;
        _magazines = getArray (_config >> "magazines");
        {
            _object removeMagazines _x;
        } forEach (_magazines arrayIntersect _magazines);
        {
            _object vehicleChat format ["Reloading %1", _x];
            sleep (_reloadTimeFactor * 2);
            _object addMagazine _x;
        } forEach _magazines;
        _count_other = count (_config >> "turrets");
        if (_count_other > 0) then {
            for "_i" from 0 to (_count_other - 1) do {
                _config2 = (_config >> "turrets") select _i;
                _magazines = getArray (_config2 >> "magazines");
                {
                    _object removeMagazines _x;
                } forEach (_magazines arrayIntersect _magazines);
                {
                    _object vehicleChat format ["Reloading %1", _x];
                    sleep (_reloadTimeFactor * 2);
                    _object addMagazine _x;
                } forEach _magazines;
            };
        };
    };
};
_object setVehicleAmmo 1; // Reload turrets / drivers magazine
sleep _reloadTimeFactor;

_object vehicleChat "Repairing...";
_object setDamage 0;
sleep _reloadTimeFactor;

_object vehicleChat "Refueling...";
while {fuel _object < 1} do {
    _object setFuel ((fuel _object + 0.1) min 1);
    sleep 0.1;
};
sleep _reloadTimeFactor;

_object vehicleChat format ["%1 is ready...", _type];
