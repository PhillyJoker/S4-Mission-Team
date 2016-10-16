

	meu_Func_checkAmmo = {
		_unit = _this select 0;
		_weapon = _this select 1;
		
		if ((_unit ammo _weapon)> 4) then {
			
			_unit setAmmo [_weapon,4];

			_weapon = currentWeapon _unit; 
			_mag = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0; 
			
			player addMagazine [_mag, 30];
		};

	};

	meu_Func_addShotCount = {

		_startCount = player getVariable "meuRangeShotCount";
		player setVariable ["meuRangeShotCount",_startCount + 1,true];
		
	};

	meu_Func_callScoreBoard = {

		_ShowDialog = {
		sleep 0.01;
		_ok = createDialog "meu_scoreBoard_main_dlg";
		waitUntil { !dialog };
		};
	 
		_void = [] call _ShowDialog;

	};

	meu_Func_loadScoreBoard = {

		disableSerialization;
		_display = (uiNamespace getVariable "meu_scoreBoard_main_dlg");
		_lb = _display displayCtrl 1500;
		lbClear 1500;
		
		{

			_name = name _x;
			
			_hits = score _x;
			_roundsFired = _x getVariable "meuRangeShotCount";
			_hitPerc = str (( _hits / _roundsFired) * 100);
			
			_index = _lb lnbAddRow ["",_name,(str _hits),(str _roundsFired),_hitPerc];
			
			// Stuff for possable future inclusion
			//_index = _lb lbAdd _text;
			//_lb lbSetValue [_index, _count];
			//_lb lbSetPicture [_index, _pic];
			//lnbSetPicture [1500,[_index,0],_pic];
			//_lb lbSetValue [_index, _count];
			
		} forEach playableUnits;

	};

// Scoreing function
	meu_Func_Target_Hit = {
		private["_shooter"];
		_shooter = _this select 1;
		_shooter addScore 1;
		//hint "Hit!";
	};

// Target popup function
	meu_Func_Popup = {
		private["_target"];
		_target = _this select 0;
		sleep 3;
		_target animate ['terc', 0];

		//hint "Test Anim up";
	};

// Target no popup function
	meu_Func_No_Pop = {
		private["_target"];
		sleep 1;
		_target = _this select 0;
		//hint str (_target animationPhase "terc");
		waitUntil {(_target animationPhase "terc") < 1};
		
		_target animate ['terc', 1];

		//hint "Test Anim Down";
	};
	
	meu_Func_clear_all_scores = {
	
		If (!isServer) exitWith {};	
		{
			_x addScore -(score _x);
			_x setVariable ["meuRangeShotCount", 0,true];
		} forEach playableUnits;

	};

	// Player clear own score function
	meu_Func_clear_my_score = {
		If (!isServer) exitWith {};
		_unit = _this select 0;	
		_unit addScore -(score _unit);
		_unit setVariable ["meuRangeShotCount", 0,true];
	};
	
	meu_Func_200_targets =
	{
		// [[0],'meu_Func_200_targets',false,false] spawn BIS_fnc_MP;
		_state = _this select 0;
		{_x animate ['terc', _state];} forEach static200targets;

	};

	meu_Func_300_targets =
	{
		_state = _this select 0;
		{_x animate ['terc', _state];} forEach static300targets;

	};

	meu_Func_500_targets =
	{
		_state = _this select 0;
		{_x animate ['terc', _state];} forEach static500targets;

	};
	
	
	meu_Func_Ukn_Dst_Random = {
	
	// 15 targets but must start with 0.
	// this will keep track of whats been poped.
	_uknTargetMasterCount = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14];
	
	_meu_Func_get_rand_targets = {
	
		//Pick 5 random targets
		_target1 = _uknTargetMasterCount call BIS_fnc_selectRandom;
	
		//remove them so we dont select them again
		_uknTargetMasterCount = _uknTargetMasterCount - [_target1];
	
		_target2 = _uknTargetMasterCount call BIS_fnc_selectRandom;
		_uknTargetMasterCount = _uknTargetMasterCount - [_target2];
		_target3 = _uknTargetMasterCount call BIS_fnc_selectRandom;
		_uknTargetMasterCount = _uknTargetMasterCount - [_target3];
		_target4 = _uknTargetMasterCount call BIS_fnc_selectRandom;
		_uknTargetMasterCount = _uknTargetMasterCount - [_target4];
		_target5 = _uknTargetMasterCount call BIS_fnc_selectRandom;
		_uknTargetMasterCount = _uknTargetMasterCount - [_target5];
		
		_list = [_target1,_target2,_target3,_target4,_target5];
		_list
	};
	
	// Start Round
		

		_showNote =[["MeuUnknownDistStart",[]],"BIS_fnc_showNotification",true,false] spawn BIS_fnc_MP;
		
		sleep 6;
		
		_targetsList = [] call _meu_Func_get_rand_targets;
		{
			_laneNum = _x;
			
			{
				(_laneNum select _x) animate ['terc', 0];
			} forEach _targetsList;
			
		
		} forEach meuUnkDistMasterArray;
		
		sleep 25;

		{
			_laneNum = _x;
			
			{
				(_laneNum select _x) animate ['terc', 1];
			} forEach _targetsList;
			
		
		} forEach meuUnkDistMasterArray;


		_showNote =[["MeuUnknownDistRoundOver",["1"]],"BIS_fnc_showNotification",true,false] spawn BIS_fnc_MP;
		
		sleep 10;

	// Start Round
		
		_targetsList = [] call _meu_Func_get_rand_targets;
		{
			_laneNum = _x;
			
			{
				(_laneNum select _x) animate ['terc', 0];
			} forEach _targetsList;
			
		
		} forEach meuUnkDistMasterArray;
		
		sleep 25;

		{
			_laneNum = _x;
			
			{
				(_laneNum select _x) animate ['terc', 1];
			} forEach _targetsList;
			
		
		} forEach meuUnkDistMasterArray;

		_showNote =[["MeuUnknownDistRoundOver",["2"]],"BIS_fnc_showNotification",true,false] spawn BIS_fnc_MP;
		
		sleep 10;
		

		// Start Round
		
		_targetsList = [] call _meu_Func_get_rand_targets;
		{
			_laneNum = _x;
			
			{
				(_laneNum select _x) animate ['terc', 0];
			} forEach _targetsList;
			
		
		} forEach meuUnkDistMasterArray;
		
		sleep 25;

		{
			_laneNum = _x;
			
			{
				(_laneNum select _x) animate ['terc', 1];
			} forEach _targetsList;
			
		
		} forEach meuUnkDistMasterArray;

		_showNote =[["MeuUnknownDistFinish",[]],"BIS_fnc_showNotification",true,false] spawn BIS_fnc_MP;	

	};
