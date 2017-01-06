// tccc addAction ["Open Testing Menu", MRB_fnc_debugMenu, "init"];

#include "\mrb_mod\script_component.hpp"

private _s3passedArguement = param [3, ""];

if (!MRB_isZeus) exitWith {
    hint "You are not in a Zeus slot, access denied.";
};

[
    "DEBUG MENU",
    [
        ["Display HC Owner(s)", "displayhc"],
        ["Display Player Owners", "displaypc"],
        ["All AI Owners", "displayai"],
        ["All AI Groups", "displayaigroup"],
        ["Ares Owner", "displayares"]
    ],
    {
        params ["_args", "_lbData"];
        if (_lbData == "") exitWith {};
        [_lbData, clientOwner] remoteExecCall ["MRB_fnc_debug", 2];
    },
    [], "TEST"
] call FNC(listDialog);
