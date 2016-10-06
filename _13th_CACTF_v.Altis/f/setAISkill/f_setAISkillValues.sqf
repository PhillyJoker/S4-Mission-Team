// Define each AI Faction setting based on either Military trained or Militia Trained.
_PARAM_Debug = "PARAM_Debug" call BIS_fnc_getParamValue;

// ====================================================================================

// SELECT AI Military SKILLS
	// Blufor Military Skill
		if (isNil "f_var_skillBluA") then { f_var_skillBluA = _highSkill; };
			publicVariable "f_var_skillBluA";
		
	// Opfor Military Skill
		if (isNil "f_var_skillOpfA") then { f_var_skillOpfA = _highSkill; };
			publicVariable "f_var_skillOpfA";
		
	// Indfor Military Skill
		if (isNil "f_var_skillIndA") then { f_var_skillIndA = _mediumSkill; };
			publicVariable "f_var_skillIndA";


// ====================================================================================

// SELECT AI Militia SKILLS
	// Blufor Militia Skill
		if (isNil "f_var_skillBluM") then { f_var_skillBluM = _lowSkill; };
			publicVariable "f_var_skillBluM";
			
	// Opfor Militia Skill
		if (isNil "f_var_skillOpfM") then { f_var_skillOpfM = _mediumSkill;	};
			publicVariable "f_var_skillOpfM";
			
	// Indfor Militia Skill
		if (isNil "f_var_skillIndM") then { f_var_skillIndM = _mediumSkill; };
			publicVariable "f_var_skillIndM";


// ====================================================================================

// SELECT CIVILIAN AI SKILLS
// If the civilian side variable is enabled, their level will be set accordingly

f_var_skillCiv = 99;
if (!isNil "f_var_civAI") then {
	f_var_skillCiv = 
	switch (f_var_civAI) do {
		case west: {f_var_skillBluA};
		case blufor: {f_var_skillBluA};
		case east: {f_var_skillOpfA};
		case opfor: {f_var_skillOpfA};
		case independent: {f_var_skillRes};
		case resistance: {f_var_skillRes};
		default {99};
	};
};
publicVariable "f_var_skillCiv";

// ====================================================================================
/*
if (_PARAM_Debug == 1) then {

	hint format [	"DEBUG:
					\nf_skillBluA = %1
					\n f_skillOpfA = %2
					\n f_skillIndA = %3
					\n f_skillBluM = %4
					\n f_skillOpfM = %5
					\n f_skillIndM = %6", 
					f_var_skillBluA,f_var_skillOpfA,f_var_skillIndA,
					f_var_skillBluM,f_var_skillOpfM,f_var_skillIndM]
			};
*/
