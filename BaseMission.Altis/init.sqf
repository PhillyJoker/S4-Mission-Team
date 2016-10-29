// Saving disabled without autosave.
enableSaving [false, false];

//ARES Additions
[] execVM "Ares additions\Ares_Reinforcement_Unit_Pools_RHS.sqf";
[] execVM "Ares additions\AresModuleAdditions.sqf";

// Template Inits
MEU_templateSeason = "winter"; // "winter" or "summer"

MEU_isTemplate = (getMissionConfigValue "respawnOnStart") == 0;

/* Omitting the template stuff because they're
 * terrain-dependent, doesn't really fit the
 * Base Mission
 */
// [] execVM "template\base_setup.sqf";
