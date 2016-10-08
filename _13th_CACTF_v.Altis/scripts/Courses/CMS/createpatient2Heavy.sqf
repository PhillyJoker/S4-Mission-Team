{if ((typeOf _x == 'b_survivor_F') && (!isPlayer _x)) then {deleteVehicle _x}} forEach allUnits;

[MedicalData2,3] call BIS_fnc_dataTerminalAnimate;
sleep 5;
_group2=createGroup west;
'b_survivor_F' createUnit [getmarkerPos 'PatientSpawn2', _group2,'pat2=this; dostop pat2'];

pat2 setdir (random 359);
/*
// Basic Medical
[pat2, 0.4, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'falling'] call ace_medical_fnc_addDamageToUnit;
[pat2, 0.8, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'bloodloss'] call ace_medical_fnc_addDamageToUnit;
[pat2, 0.4, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'falling'] call ace_medical_fnc_addDamageToUnit;
[pat2, 0.8, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'bloodloss'] call ace_medical_fnc_addDamageToUnit;
*/
[pat2, true, 9999, true]call ace_medical_fnc_setUnconscious;

[pat2, 'body', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.70] call ace_medical_fnc_handleDamage_advanced;
[pat2, 'head', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.80] call ace_medical_fnc_handleDamage_advanced;
[pat2, 'leg_l', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.70] call ace_medical_fnc_handleDamage_advanced;
[pat2, 'body', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.80] call ace_medical_fnc_handleDamage_advanced;
[pat2, 'leg_r', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.70] call ace_medical_fnc_handleDamage_advanced;
[pat2, 'hand_r', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.80] call ace_medical_fnc_handleDamage_advanced;
[pat2, 'hand_l', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.70] call ace_medical_fnc_handleDamage_advanced;

[pat2] call ace_medical_fnc_handleDamage_advancedSetDamage;


[MedicalData2,0] call BIS_fnc_dataTerminalAnimate;

hint 'Your patient is ready';