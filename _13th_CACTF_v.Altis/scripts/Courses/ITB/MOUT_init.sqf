//Created by: McKelvie
//Optimzed: 20161016

// Gets all the targets within the stated dist from the respawn_west marker.
_targetList = nearestObjects [(getMarkerPos "Tele_Range_two") , ["TargetP_Inf2_F","TargetP_Inf_F","TargetP_Inf3_F"], 1750];

// Target no popup funtion
meu_Func_No_Pop = {
		
	private["_target"];
	run = true;
	sleep 1;
	_target = _this select 0;
	//hint str (_target animationPhase "terc");
	waitUntil {(_target animationPhase "terc") >= 0};
	//waitUntil {(_target animationPhase 'terc') < 0};
	
	while {run} do {
	
	_target animate ["terc", 1];
	sleep 1;
	//run = false;
		};
	
	//hint "Test Anim Down";
};

// Prepping the arrays to hold the sorted targets
staticNWtargets = 	[];
staticNEtargets = 	[];
staticSEtargets = 	[];
staticSWtargets = 	[];
staticStargets = 	[];

// This function checks all the targets and sorts them based on catagories and stores them in arrays.
{
	
	//_x addEventHandler ["Hit", { _this call meu_Func_No_Pop; }];
	_x animate ['terc', 1];
	
	_testNW = [NWTrigger,getPosAtl _x] call BIS_fnc_inTrigger;
	_testNE = [NETrigger,getPosAtl _x] call BIS_fnc_inTrigger;
	_testSW = [SWTrigger,getPosAtl _x] call BIS_fnc_inTrigger;
	_testSE = [SETrigger,getPosAtl _x] call BIS_fnc_inTrigger;
	_testS = [STrigger,getPosAtl _x] call BIS_fnc_inTrigger;
	
	if (_testNW) then {staticNWtargets set [count staticNWtargets, _x];};
	if (_testNE) then {staticNEtargets set [count staticNEtargets, _x];};
	if (_testSW) then {staticSWtargets set [count staticSWtargets, _x];};
	if (_testSE) then {staticSEtargets set [count staticSEtargets, _x];};
	if (_testS) then {staticStargets set [count staticStargets, _x];};

} forEach _targetList;


meu_Func_NW_targets =
{
	_state = _this select 0;
	{_x animate ['terc', _state];} forEach staticNWtargets;
};

meu_Func_NE_targets =
{
	_state = _this select 0;
	{_x animate ['terc', _state];} forEach staticNEtargets;
};

meu_Func_SW_targets =
{
	_state = _this select 0;
	{_x animate ['terc', _state];} forEach staticSWtargets;
};

meu_Func_SE_targets =
{
	_state = _this select 0;
	{_x animate ['terc', _state];} forEach staticSEtargets;
};

meu_Func_S_targets =
{
	_state = _this select 0;
	{_x animate ['terc', _state];} forEach staticStargets;
};
