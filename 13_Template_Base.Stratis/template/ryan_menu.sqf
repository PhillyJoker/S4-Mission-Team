/*
tccc addAction ["Open Testing Menu", "template\ryan_menu.sqf", "init"];
*/
#include "\meu_mod\script_macros.hpp"

private _s3passedArguement = param [3, ""];

if (!MEU_isZeus) exitWith {
    hint "You are not in a Zeus slot, access denied.";
};

if (_s3passedArguement == "init") then {
    createDialog "MEU_Debug_Dialog";
    lbClear 12;
    {
        lbAdd [12, _x select 0];
        lbSetData [12, _forEachIndex, _x select 1];
    } forEach [
        ["Display HC Owner(s)", "displayhc"],
        ["Display Player Owners", "displaypc"],
        ["All AI Owners", "displayai"],
        ["All AI Groups", "displayaigroup"],
        ["Ares Owner", "displayares"]
    ];
} else {
    private _lbData = lbData [12, lbCurSel 12];
    if (_lbData == "") exitWith {};
    [_lbData, clientOwner] remoteExecCall ["MEU_fnc_debug", 2];
};
