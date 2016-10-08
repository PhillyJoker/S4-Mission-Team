{if ((typeOf _x == "b_g_survivor_F") && (!isPlayer _x)) then {deleteVehicle _x}} forEach allUnits;

[MedicalData1,3] call BIS_fnc_dataTerminalAnimate;
sleep 5;
_group1=createGroup west;
'b_g_survivor_F' createUnit [getmarkerPos 'PatientSpawn1', _group1,'pat1=this; dostop pat1'];

pat1 setdir (random 359);
/*
// Basic Medical
[pat1, 0.4, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'falling'] call ace_medical_fnc_addDamageToUnit;
[pat1, 0.8, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'bloodloss'] call ace_medical_fnc_addDamageToUnit;
[pat1, 0.4, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'falling'] call ace_medical_fnc_addDamageToUnit;
[pat1, 0.8, selectRandom ['body','head','leg_l','leg_r','hand_r','hand_l'], 'bloodloss'] call ace_medical_fnc_addDamageToUnit;
*/
[pat1, true, 9999, true]call ace_medical_fnc_setUnconscious;

[pat1, 'body', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.70] call ace_medical_fnc_handleDamage_advanced;
[pat1, 'head', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.80] call ace_medical_fnc_handleDamage_advanced;
[pat1, 'leg_l', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.70] call ace_medical_fnc_handleDamage_advanced;
[pat1, 'body', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.80] call ace_medical_fnc_handleDamage_advanced;
[pat1, 'leg_r', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.70] call ace_medical_fnc_handleDamage_advanced;
[Pat1, 'hand_r', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.80] call ace_medical_fnc_handleDamage_advanced;
[pat1, 'hand_l', 0, objNull, selectRandom ['stab','bullet','falling'], 0, 0.70] call ace_medical_fnc_handleDamage_advanced;

[pat1] call ace_medical_fnc_handleDamage_advancedSetDamage;

[MedicalData1,0] call BIS_fnc_dataTerminalAnimate;

hint "Your patient is ready";