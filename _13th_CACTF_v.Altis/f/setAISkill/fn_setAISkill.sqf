
// DECLARE VARIABLES

private ["_unit","_skill","_skillset","_skillarray","_unitfaction","_faction"];

// ====================================================================================

// SET KEY VARIABLES

_unit = _this select 0;
_skillset = if (count _this > 1) then [{_this select 1},{false}];
_skill = 99;
_skillarray = _skillset; // If _skillset is not an array of skills, _skillarray will be properly set further down
_PARAM_Debug = "PARAM_Debug" call BIS_fnc_getParamValue;
_unitfaction = tolower (faction _unit);
_faction = tolower (faction _unit);

// ====================================================================================

// FAULT CHECK
// If f_setAISkill.sqf has not been run exit with an error message

if ((isNil "f_var_skillSet") || (isNil "f_var_skillRandom")) exitWith {systemchat "F3 SetAISkill DBG: f_setAISkill.sqf needs to run before calling f_fnc_setAISkill!"};

// ====================================================================================

// If the unit was already processed, exit the function
if (_unit getVariable ["f_setAISkill",false]) exitWith {};

// ====================================================================================


if (typeName _skillset == typeName false) then {
	_skillset =
	switch (_faction) do {
			
		// Blufor
			case "rhsgref_faction_cdf_air_b": {f_var_skillBluA}; 	// Chernarus AirForce
			case "rhsgref_faction_cdf_ground_b": {f_var_skillBluA}; // Chernarus Ground Forces
			case "rhsgref_faction_cdf_ng_b": {f_var_skillBluA}; 	// Chernarus National Guard
			case "rhs_faction_usarmy_d": {f_var_skillBluA}; 		// US Army Desert
			case "rhs_faction_usarmy_wd": {f_var_skillBluA}; 		// US Army Woodland
			case "rhs_faction_usn": {f_var_skillBluA}; 				// US Navy
			case "rhs_faction_socom": {f_var_skillBluA}; 			// US Navy SOCOM
			case "rhs_faction_usaf": {f_var_skillBluA}; 			// US Air Force
			case "rhs_faction_usmc_d": {f_var_skillBluA}; 			// US Marines Desert
			case "rhs_faction_usmc_wd": {f_var_skillBluA}; 			// US Marines Woodland
			case "blu_ctrg_f": {f_var_skillBluA}; 					// CTRG
			case "blu_f": {f_var_skillBluA}; 						// NATO
			case "blu_t_f": {f_var_skillBluA}; 						// NATO Pacific
			
			
		// Blufor Insurgents
			case "blu_g_f": {f_var_skillBluM}; 						// FIA (Blufor)
			case "blu_gen_f": {f_var_skillBluM}; 					// Gendarmerie
			
		// Opfor
			case "rhs_faction_msv": {f_var_skillOpfA}; 				// Opfor Military
			case "rhs_faction_vdv": {f_var_skillOpfA}; 				// Opfor Military
			case "rhs_faction_vmf": {f_var_skillOpfA}; 				// Opfor Military
			case "rhs_faction_vvs": {f_var_skillOpfA}; 				// Opfor Military
			case "rhs_faction_vv": {f_var_skillOpfA}; 				// Opfor Military
			case "opf_f": {f_var_skillOpfA};						// CSAT Default
			case "opf_t_f": {f_var_skillOpfA};						// CSAT Pacific
			
			
		// Opfor Insurgents
			case "opf_g_f": {f_var_skillOpfM}; 						// FIA (Opfor)
			case "rhsgref_faction_chdkz": {f_var_skillOpfM}; 		// ChDKZ Insurgents
			
		// Indfor
			case "ind_f": {f_var_skillIndA};						// AAF Default
			case "rhsgref_faction_cdf_air": {f_var_skillIndA};		// Chernarus AirForce
			case "rhsgref_faction_cdf_ground": {f_var_skillIndA};	// Chernarus Ground Forces
			case "rhsgref_faction_cdf_ng": {f_var_skillIndA};		// Chernarus National Guard
			case "rhsgref_faction_un": {f_var_skillIndA};			// United Nations
			
		// Indfor Insurgents
			case "rhsgref_faction_chdkz_g": {f_var_skillIndM};		// ChDKZ Insurgents
			case "rhsgref_faction_nationalist": {f_var_skillIndM};	// Nationalist
			case "rhs_faction_insurgents": {f_var_skillIndM};		// Eastern Militia
			case "ind_c_f": {f_var_skillIndM};						// Syndikat
			
		// Civilians
			case "civ_f": {f_var_skillCiv};		// Civilians
			
		// If a faction is not defined above, default it out to this.
			default {0.5};
	};
};

//systemchat format ["Faction: %1", _unitfaction];

// ====================================================================================

// If the faction's skill level is not configured, exit and ignore the unit from now on
if (typename _skillset == typename 0 && {_skillset == 99}) exitWith {_unit setVariable ["f_setAISkill",true];};

// ====================================================================================

// If a specific skill level was passed, populate _skillArray using the new value.
if (typename _skillset == typename 0) then {
	_skill = _skillset;
	_skillArray = [];
	for '_x' from 0 to 8 do {
		_skilllevel = (f_var_skillSet select _x) * _skill;
		_skillArray pushBack (_skilllevel + random f_var_skillRandom - random f_var_skillRandom);
	};
};

// ====================================================================================

// We loop through all skilltypes and set them for the individual unit
{
	_unit setSkill [_x,_skillarray select _forEachIndex];
} forEach ['aimingAccuracy','aimingShake','aimingSpeed','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];


switch (_PARAM_Debug) do
	{
	// No
		case 0:
		{};
	// Yes
		case 1:
		{
			// CSAT Standard Katiba Tracer Replacement
			if ((_unit hasWeapon "arifle_Katiba_F") or 
				(_unit hasWeapon "arifle_Katiba_C_F") or
				(_unit hasWeapon "arifle_Katiba_C_ACO_pointer_F") or 
				(_unit hasWeapon "arifle_Katiba_C_ACO_F") or 
				(_unit hasWeapon "arifle_Katiba_ACO_F") or
				(_unit hasWeapon "arifle_Katiba_pointer_F") or 
				(_unit hasWeapon "arifle_Katiba_ACO_pointer_F") or 
				(_unit hasWeapon "arifle_Katiba_ARCO_F") or
				(_unit hasWeapon "arifle_Katiba_ARCO_pointer_F") or 
				(_unit hasWeapon "arifle_Katiba_C_ACO_pointer_snds_F") or 
				(_unit hasWeapon "arifle_Katiba_ACO_pointer_snds_F") or 
				(_unit hasWeapon "arifle_Katiba_ARCO_pointer_snds_F")) then {
					{ if ( _x in primaryWeaponMagazine _unit ) then { _unit removeMagazines _x; _unit removePrimaryWeaponItem _x; } } forEach magazines _unit;
					_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green_mag_Tracer";
					_unit addMagazines ["30Rnd_65x39_caseless_green_mag_Tracer",6]; 
				};
				
			// CSAT Standard UGL Katiba Tracer Replacement
			if ((_unit hasWeapon "arifle_Katiba_GL_F") or 
				(_unit hasWeapon "arifle_Katiba_GL_ACO_F") or 
				(_unit hasWeapon "arifle_Katiba_GL_ARCO_pointer_F") or 
				(_unit hasWeapon "arifle_Katiba_GL_ACO_pointer_F") or 
				(_unit hasWeapon "arifle_Katiba_GL_Nstalker_pointer_F") or 
				(_unit hasWeapon "arifle_Katiba_GL_ACO_pointer_snds_F")) then {
					{ if ( _x in primaryWeaponMagazine _unit ) then { _unit removeMagazines _x; _unit removePrimaryWeaponItem _x; } } forEach magazines _unit;
					_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green_mag_Tracer";
					_unit addMagazines ["30Rnd_65x39_caseless_green_mag_Tracer",6];
					_unit addWeaponItem [_x, ["1Rnd_HE_Grenade_shell", 1]];
					_unit addMagazines ["1Rnd_HE_Grenade_shell",4]; 	
				};
			
			
			// Russian Standard AK74M Tracer Replacement
			if ((_unit hasWeapon "rhs_weap_ak74m") or 
				(_unit hasWeapon "rhs_weap_ak74m_dtk") or 
				(_unit hasWeapon "rhs_weap_ak74m_pkas") or
				(_unit hasWeapon "rhs_weap_ak74m_1p63") or 
				(_unit hasWeapon "rhs_weap_ak74m_pso1m2") or 
				(_unit hasWeapon "rhs_weap_ak74m_1p29") or
				(_unit hasWeapon "rhs_weap_ak74m_camo") or 
				(_unit hasWeapon "rhs_weap_ak74m_camo_dtk") or 
				(_unit hasWeapon "rhs_weap_ak74m_npz") or
				(_unit hasWeapon "rhs_weap_ak74m_npz_dtk") or 
				(_unit hasWeapon "rhs_weap_ak74m_desert_npz") or 
				(_unit hasWeapon "rhs_weap_ak74m_camo_npz")) then {
					{ if ( _x in primaryWeaponMagazine _unit ) then { _unit removeMagazines _x; _unit removePrimaryWeaponItem _x; } } forEach magazines _unit;
					_unit addPrimaryWeaponItem "rhs_30Rnd_545x39_AK_green";
					_unit addMagazines ["rhs_30Rnd_545x39_AK_green",6]; 
			};
			
			// Russian Standard GP25 AK74M Tracer Replacement
			if ((_unit hasWeapon "RHS_WEAP_AK74M_GP25") or 
				(_unit hasWeapon "rhs_weap_ak74m_gp25_dtk") or 
				(_unit hasWeapon "rhs_weap_ak74m_gp25_npz") or
				(_unit hasWeapon "rhs_weap_ak74m_gp25_npz_dtk") or 
				(_unit hasWeapon "rhs_weap_ak74m_gp25_pkas") or 
				(_unit hasWeapon "rhs_weap_ak74m_gp25_1p63") or
				(_unit hasWeapon "rhs_weap_ak74m_gp25_pso1m2") or 
				(_unit hasWeapon "rhs_weap_ak74m_gp25_1p29")) then {
					{ if ( _x in primaryWeaponMagazine _unit ) then { _unit removeMagazines _x; _unit removePrimaryWeaponItem _x; } } forEach magazines _unit;
					_unit addPrimaryWeaponItem "rhs_30Rnd_545x39_AK_green";
					_unit addMagazines ["rhs_30Rnd_545x39_AK_green",6]; 
					_unit addWeaponItem [_x, ["1Rnd_HE_Grenade_shell", 1]];
					_unit addMagazines ["1Rnd_HE_Grenade_shell",4]; 
			};
			
			// AAF Mk20 Tracer Replacement
			if ((_unit hasWeapon "arifle_Mk20_F") or 
				(_unit hasWeapon "arifle_Mk20_plain_F") or 
				(_unit hasWeapon "arifle_Mk20C_F") or
				(_unit hasWeapon "arifle_Mk20C_plain_F") or  
				(_unit hasWeapon "arifle_Mk20C_ACO_F") or 
				(_unit hasWeapon "arifle_Mk20C_ACO_pointer_F") or 
				(_unit hasWeapon "arifle_Mk20_pointer_F") or
				(_unit hasWeapon "arifle_Mk20_Holo_F") or 
				(_unit hasWeapon "arifle_Mk20_ACO_F") or 
				(_unit hasWeapon "arifle_Mk20_ACO_pointer_F") or
				(_unit hasWeapon "arifle_Mk20_MRCO_F") or 
				(_unit hasWeapon "arifle_Mk20_MRCO_plain_F") or 
				(_unit hasWeapon "arifle_Mk20_MRCO_pointer_F") or
				(_unit hasWeapon "arifle_TRG20_ACO_F") or
				(_unit hasWeapon "arifle_TRG21_MRCO_F") or 
				(_unit hasWeapon "arifle_TRG21_F")) then {
					{ if ( _x in primaryWeaponMagazine _unit ) then { _unit removeMagazines _x; _unit removePrimaryWeaponItem _x; } } forEach magazines _unit;
					_unit addPrimaryWeaponItem "30Rnd_556x45_Stanag_Tracer_Yellow";
					_unit addMagazines ["30Rnd_556x45_Stanag_Tracer_Yellow",6]; 
			};
			
			// AAF Mk20 Tracer Replacement
			if ((_unit hasWeapon "arifle_Mk20_GL_F") or 
				(_unit hasWeapon "arifle_Mk20_GL_plain_F") or 
				(_unit hasWeapon "arifle_Mk20_GL_MRCO_pointer_F	") or 
				(_unit hasWeapon "arifle_Mk20_GL_ACO_F")) then {
					{ if ( _x in primaryWeaponMagazine _unit ) then { _unit removeMagazines _x; _unit removePrimaryWeaponItem _x; } } forEach magazines _unit;
					_unit addPrimaryWeaponItem "30Rnd_556x45_Stanag_Tracer_Yellow";
					_unit addMagazines ["30Rnd_556x45_Stanag_Tracer_Yellow",6]; 
					_unit addWeaponItem [_x, ["1Rnd_HE_Grenade_shell", 1]];
					_unit addMagazines ["1Rnd_HE_Grenade_shell",4]; 
			};
			
			// Syndikat 7.62mm
			if ((_unit hasWeapon "arifle_AK12_F") or 
				(_unit hasWeapon "arifle_AKM_F") or
				(_unit hasWeapon "arifle_AKM_FL_F")) then {
					{ if ( _x in primaryWeaponMagazine _unit ) then { _unit removeMagazines _x; _unit removePrimaryWeaponItem _x; } } forEach magazines _unit;
					_unit addPrimaryWeaponItem "30Rnd_762x39_Mag_Tracer_F";
					_unit addMagazines ["30Rnd_762x39_Mag_Tracer_F",6]; 
				};
			
			// Syndikat 7.62mm UGL
			if (_unit hasWeapon "arifle_AK12_GL_F") then {
					{ if ( _x in primaryWeaponMagazine _unit ) then { _unit removeMagazines _x; _unit removePrimaryWeaponItem _x; } } forEach magazines _unit;
					_unit addPrimaryWeaponItem "30Rnd_762x39_Mag_Tracer_F";
					_unit addMagazines ["30Rnd_762x39_Mag_Tracer_F",6]; 
					_unit addWeaponItem [_x, ["1Rnd_HE_Grenade_shell", 1]];
					_unit addMagazines ["1Rnd_HE_Grenade_shell",4]; 
				};

			// Syndikat 5.56mm
			if (_unit hasWeapon "arifle_AKS_F") then {
					{ if ( _x in primaryWeaponMagazine _unit ) then { _unit removeMagazines _x; _unit removePrimaryWeaponItem _x; } } forEach magazines _unit;
					_unit addPrimaryWeaponItem "30Rnd_545x39_Mag_Tracer_F";
					_unit addMagazines ["30Rnd_545x39_Mag_Tracer_F",6];
				};
	};
};

// Mark the unit as processed
_unit setVariable ["f_setAISkill",true];

//hint "updated";

// Return true
true