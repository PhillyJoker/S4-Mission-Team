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

    MEU_isSpectating = false;
    [
        "ACE3 Common", "toggleSpectator", "Toggle Spectator",
        {
            if !(player getVariable ["MEU_isSpectator", false]) exitWith {};
            [["Initialize", "Terminate"] select MEU_isSpectating, [player]] call BIS_fnc_EGSpectator;
            MEU_isSpectating = !MEU_isSpectating;
            true
        }, {false},
        [35, [false, false, true]] // Alt + H
    ] call CBA_fnc_addKeybind;
};
