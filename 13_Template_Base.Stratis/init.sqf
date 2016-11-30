// Call init.sqf file so it runs precisely betweeen pre and post init
call {
    // Saving disabled without autosave.
    enableSaving [false, false];
    
    //ARES Additions
    ["Ares additions\Ares_Reinforcement_Unit_Pools_RHS.sqf"] call MEU_fnc_callFile;
    ["Ares additions\AresModuleAdditions.sqf"] call MEU_fnc_callFile;
    
    // Template Inits
    MEU_templateSeason = "winter"; // "winter" or "summer"
    MEU_isTemplate = (getMissionConfigValue "respawnOnStart") == 0;
};
