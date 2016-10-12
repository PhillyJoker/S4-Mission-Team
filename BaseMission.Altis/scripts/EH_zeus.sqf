/*
Init's adding FRIES module to ZEUS placed helicopters.
Add the following to the INIT line of ALL curator module's.

EH_exec = [this] execVM "scripts\EH_exec.sqf";
*/

params ["_curator"];

// Curator Event Handler to add FRIES to Zeus placed Helicopters

_curator addEventHandler ["CuratorObjectPlaced", {
    _entity = _this select 1;
    if (_entity isKindOf "Helicopter") then {
        [_entity] call ace_fastroping_fnc_equipFRIES;
    };
}];
