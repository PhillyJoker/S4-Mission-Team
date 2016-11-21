// Saving disabled without autosave.
enableSaving [false, false];

//ARES Additions
[] execVM "Ares additions\Ares_Reinforcement_Unit_Pools_RHS.sqf";
[] execVM "Ares additions\AresModuleAdditions.sqf";

// Template Inits
MEU_templateSeason = "winter"; // "winter" or "summer"
MEU_isTemplate = (getMissionConfigValue "respawnOnStart") == 0;

if (isServer) then {
    [] execVM "template\base_setup_server.sqf";
};
if (hasInterface) then {
    [] execVM "template\base_setup_client.sqf";
};
