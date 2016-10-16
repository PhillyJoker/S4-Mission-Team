
// Gets all the targets within the stated dist from the respawn_west marker.
_targetList = nearestObjects [(getMarkerPos "Tele_Range_two") , ["TargetP_Inf2_Acc2_F"], 3000];

//nopop = false;

//sleep 5;

// Prepping the arrays to hold the sorted targets
static200targets = [];
static300targets = [];
static500targets = [];

uKNDTargestLane1 = [];
uKNDTargestLane2 = [];
uKNDTargestLane3 = [];
uKNDTargestLane4 = [];
uKNDTargestLane5 = [];
uKNDTargestLane6 = [];
uKNDTargestLane7 = [];
uKNDTargestLane8 = [];
uKNDTargestLane9 = [];
uKNDTargestLane10 = [];
uKNDTargestLane11 = [];
uKNDTargestLane12 = [];
uKNDTargestLane13 = [];
uKNDTargestLane14 = [];
uKNDTargestLane15 = [];
uKNDTargestLane16 = [];
uKNDTargestLane17 = [];
uKNDTargestLane18 = [];
uKNDTargestLane19 = [];
uKNDTargestLane20 = [];

// This function checks all the targets and sorts them based on catagories and stores them in arrays.
{
	_x addEventHandler ["Hit", {_this call meu_Func_Target_Hit; _this spawn meu_Func_Popup;}];
	_x animate ['terc', 1];
	
	_test200 = [targetlist200trigger,getPosAtl _x] call BIS_fnc_inTrigger;
	_test300 = [targetlist300trigger,getPosAtl _x] call BIS_fnc_inTrigger;
	_test500 = [targetlist500trigger,getPosAtl _x] call BIS_fnc_inTrigger;
	
	_testUKNDistLn1 = [ukdtriggerlane1,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn2 = [ukdtriggerlane2,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn3 = [ukdtriggerlane3,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn4 = [ukdtriggerlane4,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn5 = [ukdtriggerlane5,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn6 = [ukdtriggerlane6,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn7 = [ukdtriggerlane7,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn8 = [ukdtriggerlane8,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn9 = [ukdtriggerlane9,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn10 = [ukdtriggerlane10,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn11 = [ukdtriggerlane11,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn12 = [ukdtriggerlane12,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn13 = [ukdtriggerlane13,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn14 = [ukdtriggerlane14,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn15 = [ukdtriggerlane15,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn16 = [ukdtriggerlane16,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn17 = [ukdtriggerlane17,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn18 = [ukdtriggerlane18,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn19 = [ukdtriggerlane19,getPosAtl _x] call BIS_fnc_inTrigger;
	_testUKNDistLn20 = [ukdtriggerlane20,getPosAtl _x] call BIS_fnc_inTrigger;
	
	
	if (_test200) then {static200targets set [count static200targets, _x];};
	if (_test300) then {static300targets set [count static300targets, _x];};
	if (_test500) then {static500targets set [count static500targets, _x];};
	
	if (_testUKNDistLn1) then {uKNDTargestLane1 set [count uKNDTargestLane1, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn2) then {uKNDTargestLane2 set [count uKNDTargestLane2, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn3) then {uKNDTargestLane3 set [count uKNDTargestLane3, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn4) then {uKNDTargestLane4 set [count uKNDTargestLane4, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn5) then {uKNDTargestLane5 set [count uKNDTargestLane5, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn6) then {uKNDTargestLane6 set [count uKNDTargestLane6, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn7) then {uKNDTargestLane7 set [count uKNDTargestLane7, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn8) then {uKNDTargestLane8 set [count uKNDTargestLane8, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn9) then {uKNDTargestLane9 set [count uKNDTargestLane9, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn10) then {uKNDTargestLane10 set [count uKNDTargestLane10, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn11) then {uKNDTargestLane11 set [count uKNDTargestLane11, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn12) then {uKNDTargestLane12 set [count uKNDTargestLane12, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn13) then {uKNDTargestLane13 set [count uKNDTargestLane13, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn14) then {uKNDTargestLane14 set [count uKNDTargestLane14, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn15) then {uKNDTargestLane15 set [count uKNDTargestLane15, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn16) then {uKNDTargestLane16 set [count uKNDTargestLane16, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn17) then {uKNDTargestLane17 set [count uKNDTargestLane17, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn18) then {uKNDTargestLane18 set [count uKNDTargestLane18, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn19) then {uKNDTargestLane19 set [count uKNDTargestLane19, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};
	if (_testUKNDistLn20) then {uKNDTargestLane20 set [count uKNDTargestLane20, _x];_x addEventHandler ["Hit", {_this spawn meu_Func_No_Pop;}];};

} forEach _targetList;




// Unknow distance functions

meuUnkDistMasterArray = [uKNDTargestLane1,uKNDTargestLane2,uKNDTargestLane3,uKNDTargestLane4,uKNDTargestLane5,uKNDTargestLane6,uKNDTargestLane7,uKNDTargestLane8,uKNDTargestLane9,uKNDTargestLane10,uKNDTargestLane11,uKNDTargestLane12,uKNDTargestLane13,uKNDTargestLane14,uKNDTargestLane15,uKNDTargestLane16,uKNDTargestLane17,uKNDTargestLane18,uKNDTargestLane19,uKNDTargestLane20];

// Add some actions to range master.
rc1 addAction ["200m Targets Up","[[0],'meu_Func_200_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["200m Targets Down","[[1],'meu_Func_200_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["300m Targets Up","[[0],'meu_Func_300_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["300m Targets Down","[[1],'meu_Func_300_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["500m Targets Up","[[0],'meu_Func_500_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["500m Targets Down","[[1],'meu_Func_500_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["Clear Score","[[player],'meu_Func_clear_my_score',false,false] spawn BIS_fnc_MP;"];
rc1 addAction ["Clear All Scores","[[[]],'meu_Func_clear_all_scores',false,false] spawn BIS_fnc_MP;",1];

rc2 addAction ["Clear Score","[[player],'meu_Func_clear_my_score',false,false] spawn BIS_fnc_MP;"];
rc2 addAction ["Clear All Scores","[[[]],'meu_Func_clear_all_scores',false,false] spawn BIS_fnc_MP;",1];
rc2 addAction ["Start Uknown Dist Course","[[],'meu_Func_Ukn_Dst_Random',false,false] spawn BIS_fnc_MP;",1];
