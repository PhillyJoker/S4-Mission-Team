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
};
