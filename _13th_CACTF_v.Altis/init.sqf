enableSaving [false, false];

nopop=true;

// sets skill level of any pre-placed ai on the map
[] execVM "f\setAISKill\f_setAISkill.sqf";


// Set the Briefing
	[] execVM "scripts\Client\briefing.sqf";
	
// Execute Funtions
	[] execVM "scripts\functions.sqf";


// Wait until player is initialized
if (!isDedicated) then {waitUntil {!isNull player && isPlayer player};};

//TFAR Options
TF_give_personal_radio_to_regular_soldier = true;
tf_no_auto_long_range_radio = true;