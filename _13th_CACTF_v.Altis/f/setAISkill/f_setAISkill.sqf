
// RUN THE SCRIPT ONLY SERVER SIDE

if !(isServer) exitWith {};

// ====================================================================================

// WAIT FOR THE MISSION TO BEGIN
// By waiting a few seconds into the mission the server is giving time to settle and it assures that the component catches AI created during init

sleep 2;

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_units","_lowSkill","_mediumSkill","_highSkill","_superSkill"];


// ====================================================================================

// DEFINE SKILL LEVELS

_superSkill = 1.00;
_highSkill = 0.85;
_mediumSkill = 0.7;
_lowSkill = 0.55;


f_var_skillSet = [
	0.60,		// aimingAccuracy
	0.82,		// aimingShake
	0.20,		// aimingSpeed
	0.65,		// spotDistance
	0.05,		// spotTime
	1.0,		// courage
	0.5,		// reloadSpeed
	1.0,		// commanding
	1.0			// general
];


// The final skill will within +/- this range
f_var_skillRandom = 0.09;

// ====================================================================================

// BROADCAST PUBLIC VARIABLES
// Make the relevant global variables known to all clients

{publicVariable _x} forEach ["f_var_skillRandom","f_var_skillSet"];

// ====================================================================================

// SET UP SKILL Levels
// As the params can only set full numbers, we interpret each of them to set the correct value

#include "f_setAISkillValues.sqf";

// ====================================================================================

// SET KEY VARIABLES
// If an array of units was passed, the skill change will apply only to the units in the array

_units = if (count _this > 0) then [{_this},{allUnits}];

// ====================================================================================

// SET SKILL LEVELS FOR ALL AI
// AI Skill for all AIs is set using side levels (see above).
// By using the BI function BIS_fnc_MP we ensure that AI is set to the correct level for all connected clients, including the server

{

private ["_skill","_skillarray"];
_skill = 0;
_skillArray = [];

    if !(_x getVariable ["f_setAISkill",false]) then {
		// We change the value of skill to the appropiate one depending on the unit's side
/*
		switch (side _x) do {
			_skill = f_var_skillOPF;
		};
*/
		// If skill is 99 it is not configured in the params and the unit will be ignored
		if (_skill == 99) exitWith {
			_x setVariable ["f_setAISkill",true];
		};

		for "_i" from 0 to 8 do {
			_skilllevel = (f_var_skillSet select _i) * _skill;
			_skillArray pushBack (_skilllevel + random f_var_skillRandom - random f_var_skillRandom);
		};

		// Call the function to set the skills for the unit
		[_x,_skillArray] call f_fnc_setAISkill;
     };

} forEach _units;

