if (!hasInterface) exitWith {};

[
    "cTab", "callSignMenu", "Call Sign Menu",
    MEU_fnc_showDialog, {false},
    [47, [false, true, true]]
] call CBA_fnc_addKeybind;

_callSign = profileNamespace getVariable ["MEU_callSign", ""];
if (_callSign == "" || {player != leader player}) exitWith {};
player setGroupIdGlobal [_callSign];
