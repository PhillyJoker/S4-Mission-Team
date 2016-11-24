// Saving disabled without autosave.
enableSaving [false, false];

//ARES Additions
call compile preProcessFileLineNumbers "Ares additions\Ares_Reinforcement_Unit_Pools_RHS.sqf";
call compile preProcessFileLineNumbers "Ares additions\AresModuleAdditions.sqf";

// Template Inits
MEU_templateSeason = "winter"; // "winter" or "summer"
MEU_isTemplate = (getMissionConfigValue "respawnOnStart") == 0;
