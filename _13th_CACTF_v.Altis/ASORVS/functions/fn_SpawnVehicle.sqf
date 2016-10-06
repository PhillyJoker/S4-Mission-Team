_veh = _this select 0;

objNull spawn {
	sleep 2; //wait for client to be able to check vehicles positions properly again.
	_somedeleted =false;
	{
		deleteVehicle _x;
		_somedeleted =true;
	}
	forEach (ASORVS_VehicleSpawnPos nearEntities ASORVS_VehicleSpawnRadius);
	if(_somedeleted) then {
		sleep 2;
	};
	_veh = createVehicle [ASORVS_CurrentVehicle, ASORVS_VehicleSpawnPos, [], 0, "CAN_COLLIDE"];
	_veh setVehicleLock "UNLOCKED";
	_veh setDir ASORVS_VehicleSpawnDir;
	if((_veh iskindof "JS_JC_FA18F") || (_veh iskindof "JS_JC_FA18E")) then {
		_veh setvehicleammo 1;
		{_veh removeMagazine _x} forEach magazines _veh;
		removeAllWeapons _veh;
	};
	
};