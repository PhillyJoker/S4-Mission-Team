

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