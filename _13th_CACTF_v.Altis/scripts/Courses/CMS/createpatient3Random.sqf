{if ((typeOf _x == 'b_soldier_unarmed_f') && (!isPlayer _x)) then {deleteVehicle _x}} forEach allUnits;

[MedicalData3,3] call BIS_fnc_dataTerminalAnimate;
sleep 5;
_group3=createGroup west;
'b_soldier_unarmed_f' createUnit [getmarkerPos 'PatientSpawn3', _group3,'pat3=this; dostop pat3'];

pat3 setdir (random 359);
/*
// Basic Medical
[pat3, 0.4, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'falling'] call ace_medical_fnc_addDamageToUnit;
[pat3, 0.8, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'bloodloss'] call ace_medical_fnc_addDamageToUnit;
[pat3, 0.4, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'falling'] call ace_medical_fnc_addDamageToUnit;
[pat3, 0.8, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'bloodloss'] call ace_medical_fnc_addDamageToUnit;
*/
[pat3, true, 9999, true]call ace_medical_fnc_setUnconscious;

[pat3, 'body', 0, objNull, selectRandom ['stab','bullet','falling'], 0, selectRandom [0.20,0.40,0.60,0.80]] call ace_medical_fnc_handleDamage_advanced;
[pat3, 'head', 0, objNull, selectRandom ['stab','bullet','falling'], 0, selectRandom [0.20,0.40,0.60,0.80]] call ace_medical_fnc_handleDamage_advanced;
[pat3, 'leg_l', 0, objNull, selectRandom ['stab','bullet','falling'], 0, selectRandom [0.20,0.40,0.60,0.80]] call ace_medical_fnc_handleDamage_advanced;
[pat3, 'body', 0, objNull, selectRandom ['stab','bullet','falling'], 0, selectRandom [0.20,0.40,0.60,0.80]] call ace_medical_fnc_handleDamage_advanced;
[pat3, 'leg_r', 0, objNull, selectRandom ['stab','bullet','falling'], 0, selectRandom [0.20,0.40,0.60,0.80]] call ace_medical_fnc_handleDamage_advanced;
[pat3, 'hand_r', 0, objNull, selectRandom ['stab','bullet','falling'], 0, selectRandom [0.20,0.40,0.60,0.80]] call ace_medical_fnc_handleDamage_advanced;
[pat3, 'hand_l', 0, objNull, selectRandom ['stab','bullet','falling'], 0, selectRandom [0.20,0.40,0.60,0.80]] call ace_medical_fnc_handleDamage_advanced;

[pat3] call ace_medical_fnc_handleDamage_advancedSetDamage;


[MedicalData3,0] call BIS_fnc_dataTerminalAnimate;

hint 'Your patient is ready';
 