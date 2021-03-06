#include "\mrb_mod\script_component.hpp"

// Saving disabled without autosave.
enableSaving [false, false];

// ARES Additions
[] call FNC(aresModuleAdditions);
[] call FNC(aresReinforcementUnitPoolsRHS);

// Template Inits
MRB_templateSeason = "winter"; // "winter" or "summer"
MRB_isTemplate = (getMissionConfigValue "respawnOnStart") == 0;

if (isServer) then {
    [] call FNC(baseSetupServer);
};

if (hasInterface) then {
    [] call FNC(baseSetupClient);

    MRB_isSpectating = false;
    [
        "ACE3 Common", "toggleSpectator", "Toggle Spectator",
        {
            if !(player getVariable ["MRB_isSpectator", false]) exitWith {};
            [["Init", "Exit"] select MRB_isSpectating] call BIS_fnc_camera;
            MRB_isSpectating = !MRB_isSpectating;
            true
        }, {false},
        [35, [false, false, true]] // Alt + H
    ] call CBA_fnc_addKeybind;
};
