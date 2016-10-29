if (!isClass (configFile >> "CfgPatches" >> "Ares")) exitWith {};
// Ares is loaded, register the custom modules.

["AI Behaviours", "Turn Engine On/Off", {
    params ["_pos", "_object"];

    if !(_object isKindOf "Car" || {_object isKindOf "Ship"} || {_object isKindOf "Air"}) exitWith {
        [objNull, "Object is not a vehicle."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    _dialogResult = ["Engine", [["Mode:", ["On", "Off"]]]] call Ares_fnc_ShowChooseDialog;

    if !(_dialogResult isEqualTo []) then {
        _state = [true, false] select (_dialogResult select 0);
        _object engineOn _state;
    } else {
        [objNull, "No input given, engine not adjusted."] call BIS_fnc_showCuratorFeedbackMessage;
    };
}] call Ares_fnc_RegisterCustomModule;

["AI Behaviours", "Dismount Vehicle", {
    params ["_pos", "_object"];

    if ((crew _object) isEqualTo []) exitWith {
        [objNull, "Object has no units."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    _dialogResult = [
        "Dismount",
        [["Selection:", ["All", "Driver", "Commander", "Gunner", "Cargo"]]]
    ] call Ares_fnc_ShowChooseDialog;

    if !(_dialogResult isEqualTo []) then {
        _units = [
            crew _object,
            [driver _object],
            [commander _object],
            [gunner _object],
            (crew _object) - [driver _object, commander _object, gunner _object],
        ] select (_dialogResult select 0);

        _units orderGetIn false;
    } else {
        [objNull, "No input given, no dismounts."] call BIS_fnc_showCuratorFeedbackMessage;
    };
}] call Ares_fnc_RegisterCustomModule;

["Arsenal", "Add 'Clear Loadout' Action", {
    params ["_pos", "_object"];

    if (isNull _object) exitWith {
        [objnull, "No object under cursor."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    [
        _object,
        ["Clear Loadout", "scripts\clear_loadout.sqf", [], 6, true, true, "", "true", 5]
    ] remoteExec ["addAction", 0, true];
    [objNull, "'Clear Loadout' action added to object."] call BIS_fnc_showCuratorFeedbackMessage;
}] call Ares_fnc_RegisterCustomModule;

["AI Behaviours", "Drop All Weapons", {
    params ["_pos", "_object"];

    if ((weapons _object) isEqualTo []) exitWith {
        [objNull, "Object has no weapons."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    {
        _pos = getPosASL _object;
        _object removeWeapon _x;
        _ground = createVehicle ["GroundWeaponHolder", _pos, [], 1, "CAN_COLLIDE"];
        _ground getPosASL _pos;
        _ground addWeaponCargoGlobal [_x, 1];
    } forEach (weapons _object);
}] call Ares_fnc_RegisterCustomModule;

["AI Behaviours", "Set Fly Height", {
    params ["_pos", "_object"];

    if !(_object isKindOf "Air") exitWith {
        [objNull, "Object isn't a air unit."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    _dialogResult = [
        "Flying Height",
        [["Height:", ["50m", "100m", "200m", "300m"]]]
    ] call Ares_fnc_ShowChooseDialog;

    if (_dialogResult isEqualTo []) exitWith {
        [objNull, "No input given, height not set."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    _height = [50, 100, 200, 300] select (_dialogResult select 0);
    _object flyInHeight _height;
}] call Ares_fnc_RegisterCustomModule;

["AI Behaviours", "Land Aircraft", {
    params ["_pos", "_object"];

    if !(_object isKindOf "Air") exitWith {
        [objNull, "Object isn't a air unit."] call BIS_fnc_showCuratorFeedbackMessage;
    };
    _object land "LAND";
}] call Ares_fnc_RegisterCustomModule;

["Reinforcements", "Spawn Units v2", {
    if (
        isNil "Ares_Reinforcement_Unit_Pools" ||
        {!(Ares_Reinforcement_Unit_Pools isEqualType [])} ||
        {Ares_Reinforcement_Unit_Pools isEqualTo []}
    ) exitWith {
        [objNull, "Unable to load unit pools. Is your 'Ares_Reinforcement_Unit_Pools.sqf' file corrupt?"] call BIS_fnc_showCuratorFeedbackMessage;
    };

    private _allUnitPools = Ares_Reinforcement_Unit_Pools
    if (!isNil "Ares_Reinforcement_Mission_Unit_Pools") then {
        _allUnitPools append Ares_Reinforcement_Mission_Unit_Pools;
    };

    _allLzsUnsorted = allMissionObjects "Ares_Module_Reinforcements_Create_Lz";
    if (_allLzsUnsorted isEqualTo []) exitWith {
        [objNull, "You must have at least one LZ for the transport to head to."] call BIS_fnc_showCuratorFeedbackMessage;
    };
    _allLzs = [_allLzsUnsorted, [], {_x getVariable ["SortOrder", 0];}, "ASCEND"] call BIS_fnc_sortBy;

    _allRpsUnsorted = allMissionObjects "Ares_Module_Reinforcements_Create_Rp";
    _allRps = [_allRpsUnsorted, [], {_x getVariable ["SortOrder", 0];}, "ASCEND"] call BIS_fnc_sortBy;

    // Generate list of pool names to let user choose from

    _validPools = _allUnitPools select {(_x select 2) == "" || {isClass (configFile >> "CfgPatches" >> (_x select 2))}};
    _poolNames = _validPools apply {_x select 0};

    _lzOptions = ["Random", "Nearest", "Farthest", "Least Used"];
    {
        _lzOptions pushBack (name _x);
    } forEach _allLzs;

    _rpOptions = ["Random", "Nearest", "Farthest", "Least Used"];
    {
        _rpOptions pushBack (name _x);
    } forEach _allRps;

    // Show the user the dialog
    _dialogResult = [
        "Create Reinforcements",
        [
            ["Side", _poolNames, 0],
            ["Vehicle Type", ["Unarmed Light Transport", "APC's & Light Transport", "Dedicated Troop Transport", "IFV's & Heavy Transports", "Unarmed Helicopters", "Armed Helicopters", "Unarmed Boats", "Armed Boats"]],
            ["Vehicle Behaviour After Dropoff", ["RTB and Despawn", "Stay at LZ"]],
            ["Vehicle Landing Zone", _lzOptions],
            ["Unit Rally Point", _rpOptions],
            ["Unit Behaviour", ["Default", "Relaxed", "Cautious", "Combat"]]
        ]
    ] call Ares_fnc_ShowChooseDialog;

    if (_dialogResult isEqualTo []) exitWith{};

    // Get the data from the dialog to use when choosing what units to spawn
    _dialogResult params [
        "_dialogPool",
        "_dialogVehicleClass",
        "_dialogVehicleBehaviour",
        "_dialogLzAlgorithm",
        "_dialogRpAlgorithm",
        "_dialogUnitBehaviour"
    ];
    _lzSize = 20; // TODO make this a dialog parameter?
    _rpSize = 20; // TODO make this a dialog parameters?
    _spawnPosition = [
        _this select 0,
        Ares_CuratorObjectPlaces_LastPlacedObjectPosition
    ] select (!isNil "Ares_CuratorObjectPlaces_LastPlacedObjectPosition");

    // Lz's for helicopters get more randomness because they tend to crash into eachother.
    if (_dialogVehicleClass in [7, 8]) then {
        _lzSize = 150;
    };

    // Choose the LZ based on what the user indicated
    _lz = _allLzs select (_dialogLzAlgorithm - 4);
    switch (_dialogLzAlgorithm) do {
        case 0: { // Random
            _lz = selectRandom _allLzs;
        };
        case 1: { // Nearest
            _lz = [_spawnPosition, _allLzs] call Ares_fnc_GetNearest;
        };
        case 2: { // Furthest
            _lz = [_spawnPosition, _allLzs] call Ares_fnc_GetFarthest;
        };
        case 3: { // Least used
            _lz = selectRandom _allLzs; // Choose randomly to start.
            {
                if (_x getVariable ["Ares_Lz_Count", 0] < _lz getVariable ["Ares_Lz_Count", 0]) then {
                    _lz = _x;
                };
            } forEach _allLzs;
        };
    };

    // Now that we've chosen an LZ, increment the count for it.
    _lz setVariable ["Ares_Lz_Count", (_lz getVariable ["Ares_Lz_Count", 0]) + 1];

    // Get the unit pool and the side it's associated with
    _pool = _validPools select _dialogPool;
    _side = _pool select 1;

    if ((_pool select 11) isEqualTo []) exitWith {
        [objNull, "No infantry squads defined for side."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    // Spawn a vehicle, send it to the LZ and have it unload the troops before returning home and
    // deleting itself.
    _vehiclePoolIndex = _dialogVehicleClass + 3;

    if ((_pool select _vehiclePoolIndex) isEqualTo []) exitWith {
        [objNull, "Vehicle pool had no vehicles defined for this faction."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    _vehPool = _pool select _vehiclePoolIndex;
    _vehNames = _vehPool apply {getText (configFile >> "CfgVehicles" >> _x >> "displayname")};

    // Show the user the dialog
    _dialog2Result = [
        "Choose Vehicle Type",
        [
            ["Type", _vehNames],
            ["On Station", ["5", "30", "60", "120"]],
            ["Number of teams", ["1", "2", "3", "4"]],
            ["Size of teams", ["3", "4", "5", "6"]]
        ]
    ] call Ares_fnc_ShowChooseDialog;

    if (_dialog2Result isEqualTo []) exitWith {};

    // Get the data from the dialog to use when choosing what units to spawn
    _dialog2Result params ["_dialog2Type", "_dialog2TimeOut", "_dialog2TeamNumber", "_dialog2TeamSize"];

    _vehicleType = _vehPool select _dialog2Type;
    _vehicleGroup = ([_spawnPosition, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle) select 2;

    _vehicleDummyWp = _vehicleGroup addWaypoint [position _vehicle, 0];
    _vehicleUnloadWp = _vehicleGroup addWaypoint [position _lz, _lzSize];
    _vehicleUnloadWp setWaypointType "TR UNLOAD";

    // Make the driver full skill. This makes him less likely to do dumb things
    // when they take contact.
    _timeOut = [5, 30, 60, 120] select _dialog2TimeOut;
    (driver (vehicle (leader _vehicleGroup))) setSkill 1;

    if (_vehiclePoolIndex in [7,8]) then {
        // Special settings for helicopters. Otherwise they tend to run away instead of land
        // if the LZ is hot.
        {
            _x allowFleeing 0; // Especially for helicopters... They're very cowardly.
        } forEach (crew (vehicle (leader _vehicleGroup)));
        _vehicleUnloadWp setWaypointTimeout [_timeOut,_timeOut,_timeOut];
    } else {
        _vehicleUnloadWp setWaypointTimeout [_timeOut,_timeOut,_timeOut]; // Give the units some time to get away from truck
    };

    // Generate the waypoints for after the transport drops off the troops.
    if (_dialogVehicleBehaviour == 0) then {
        // RTB and Despawn.
        _vehicleReturnWp = _vehicleGroup addWaypoint [_spawnPosition, 0];
        _vehicleReturnWp setWaypointTimeout [5, 5, 5]; // Let the unit stop before being despawned.
        _vehicleReturnWp setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} foreach thisList;"];
    };

    // Add vehicle to curator
     [(units _vehicleGroup) + [vehicle (leader _vehicleGroup)]] call Ares_fnc_AddUnitsToCurator;

    // Spawn the units and load them into the vehicle
    _vehicle = vehicle (leader _vehicleGroup);
    _emptyPos = _vehicle emptyPositions "Cargo";
    _teamNumber = _dialog2TeamNumber + 1;
    _teamSize = _dialog2TeamSize + 3;
    _num = _teamNumber;
    if ((_emptyPos / _teamSize) < _teamNumber) then {
        _num = (floor (_emptyPos / _teamSize)) max 1;
        [objNull, "Number of teams too big for vehicle, set to highest possible"] call BIS_fnc_showCuratorFeedbackMessage;
    };

    for "_i" from 1 to _num do {
        private _squadMembers = selectRandom (_pool select 11);
        if (count _squadMembers >= _teamSize) then {
            _squadMembers resize _teamSize;
        };
        _freeSpace = _vehicle emptyPositions "Cargo";
        if (_freeSpace < count _squadMembers) then {
            // Trim the squad size so they will fit.
            _squadMembers resize _freeSpace;
        };

        // Spawn the squad members.
        _infantryGroup = [_spawnPosition, _side, _squadMembers] call BIS_fnc_spawnGroup;

        // Set the default behaviour of the squad
        switch (_dialogUnitBehaviour) do {
            case 1: { // Relaxed
                _infantryGroup setBehaviour "SAFE";
                _infantryGroup setSpeedMode "LIMITED";
            };
            case 2: { // Cautious
                _infantryGroup setBehaviour "AWARE";
                _infantryGroup setSpeedMode "LIMITED";
            };
            case 3: { // Combat
                _infantryGroup setBehaviour "COMBAT";
                _infantryGroup setSpeedMode "NORMAL";
            };
        };

        // Choose a RP for the squad to head to once unloaded and set their waypoint.
        if !(_allRps isEqualTo []) then {
            // Choose the RP based on the algorithm the user selected
            _rp = _allRps select (_dialogRpAlgorithm - 4);
            switch (_dialogRpAlgorithm) do {
                case 0: { // Random
                    _rp = selectRandom _allRps;
                };
                case 1: { // Nearest
                    _rp = [position _lz, _allRps] call Ares_fnc_GetNearest;
                };
                case 2: { // Furthest
                    _rp = [position _lz, _allRps] call Ares_fnc_GetFarthest;
                };
                case 3: { // Least Used
                    _rp = selectRandom _allRps; // Choose randomly to begin with.
                    {
                        if (_x getVariable ["Ares_Rp_Count", 0] < _rp getVariable ["Ares_Rp_Count", 0]) then {
                            _rp = _x;
                        }
                    } forEach _allRps;
                };
            };

            // Now that we've chosen an RP, increment the count for it.
            _rp setVariable ["Ares_Rp_Count", (_rp getVariable ["Ares_Rp_Count", 0]) + 1];

            _infantryRpWp = _infantryGroup addWaypoint [position _rp, _rpSize];
        } else {
            _infantryMoveOnWp = _infantryGroup addWaypoint [position _lz, _rpSize];
        };

        // Load the units into the vehicle.
        {
            _x moveInCargo (vehicle (leader _vehicleGroup));
        } foreach (units _infantryGroup);

        // Add infantry to curator
        [units _infantryGroup] call Ares_fnc_AddUnitsToCurator;
    };

    if !(_allRps isEqualTo []) then {
        [objNull, "Transport dispatched to LZ. Squad will head to RP."] call BIS_fnc_showCuratorFeedbackMessage;
    } else {
        [objNull, "Transport dispatched to LZ. Squad will stay at LZ."] call BIS_fnc_showCuratorFeedbackMessage;
    };
}] call Ares_fnc_RegisterCustomModule;

["AI Behaviours", "Patrol v2", {
    params ["_pos", "_object"];

    if (isNull _object) then {
        ["No unit under cursor!!"] call Ares_fnc_LogMessage;
    };

    _groupUnderCursor = group _object;
    if (isNull _groupUnderCursor) exitWith {
        [objnull, "No group under cursor."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    _doesGroupContainAnyPlayer = ({isPlayer _x} count (units _groupUnderCursor)) > 0;
    if (_doesGroupContainAnyPlayer) exitWith {
        [objnull, "Cannot add patrol for player units."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    ["BehaviourPatrol: Group under cursor was not null - showing prompt"] call Ares_fnc_LogMessage;
    _dialogResult = [
        "Begin Patrol",
        [
            ["Size of patrol grid:", ["50m", "100m", "150m", "250m", "500m"]],
            ["Behaviour:", ["Relaxed", "Cautious", "Searching"]],
            ["Formation:", ["None", "Column", "Stag Column", "Wedge", "Ech left", "Ech right", "Vee", "Line", "File", "Diamond"]],
            ["Direction:", ["Clockwise", "Counter-Clockwise"]],
            ["Delay at waypoints:", ["None", "5s", "10s", "15s", "20s", "30s", "1m"]],
            ["Number of waypoints:", ["2", "3", "4", "5", "6"]]
        ]
    ] call Ares_fnc_ShowChooseDialog;

    ["BehaviourPatrol: Prompt complete!"] call Ares_fnc_LogMessage;

    if (_dialogResult isEqualTo []) exitWith {
        [objnull, "No input given, patrol path not set up."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    _radius = [50, 100, 150, 250, 500] select (_dialogResult select 0);

    switch (_dialogResult select 1) do {
        case 1: {
            // Cautious
            _groupUnderCursor setBehaviour "AWARE";
            _groupUnderCursor setSpeedMode "LIMITED";
        };
        case 2: {
            // Searching
            _groupUnderCursor setBehaviour "COMBAT";
            _groupUnderCursor setSpeedMode "NORMAL";
        };
        default { // Case0 and default
            // Relaxed
            _groupUnderCursor setBehaviour "SAFE";
            _groupUnderCursor setSpeedMode "LIMITED";
        };
    };

    private _formation = [
        "NO CHANGE",
        "COLUMN",
        "STAG COLUMN",
        "WEDGE",
        "ECH LEFT",
        "ECH RIGHT",
        "VEE",
        "LINE",
        "FILE",
        "DIAMOND"
    ] select (_dialogResult select 2);

    private _moveClockwise = (_dialogResult select 3) == 0;

    private _delay = [
        [0, 0, 0],
        [0, 5, 10],
        [5, 10, 15],
        [10, 15, 20],
        [15, 20, 25],
        [20, 30, 40],
        [45, 60, 75]
    ] select (_dialogResult select 4);

    // Remove other waypoints.
    while {!(waypoints _groupUnderCursor isEqualTo [])} do {
        deleteWaypoint ((waypoints _groupUnderCursor) select 0);
    };

    // Make a circle with the unit's current location at the center.
    private _numberOfWaypoints = (_dialogResult select 5) + 2;
    private _degreesPerWaypoint = 360 / _numberOfWaypoints;
    if (!_moveClockwise) then {
        _degreesPerWaypoint = _degreesPerWaypoint * -1;
    };
    private _centerPoint = position _object;
    for "_waypointNumber" from 0 to (_numberOfWaypoints - 1) do {
        private _currentDegrees = _degreesPerWaypoint * _waypointNumber;
        _waypoint = _groupUnderCursor addWaypoint [_centerPoint getPos [_radius, _currentDegrees], 5];
        _waypoint setWaypointFormation _formation;
        _waypoint setWaypointTimeout _delay;
    };

    // Add a waypoint at the location of the first WP. We started at 0 degrees.
    // We don't delay the cycle WP since then we'd have double-time before moving.
    private _waypoint = _groupUnderCursor addWaypoint [_centerPoint getPos [_radius, 0], 5];
    _waypoint setWaypointType "CYCLE";

    [objnull, "Patrol path setup for units."] call BIS_fnc_showCuratorFeedbackMessage;
}] call Ares_fnc_RegisterCustomModule;

["PLA", "Spawn Vehicle with Units", {
    if (
        isNil "Ares_Reinforcement_Unit_Pools" ||
        {!(Ares_Reinforcement_Unit_Pools isEqualType [])} ||
        {Ares_Reinforcement_Unit_Pools isEqualTo []}
    ) exitWith {
        [objNull, "Unable to load unit pools. Is your 'Ares_Reinforcement_Unit_Pools.sqf' file corrupt?"] call BIS_fnc_showCuratorFeedbackMessage;
    };

    private _allUnitPools = Ares_Reinforcement_Unit_Pools
    if (!isNil "Ares_Reinforcement_Mission_Unit_Pools") then {
        _allUnitPools append Ares_Reinforcement_Mission_Unit_Pools;
    };

    // Generate list of pool names to let user choose from
    _validPools = _allUnitPools select {(_x select 2) == "" || {isClass (configFile >> "CfgPatches" >> (_x select 2))}};
    _poolNames = _validPools apply {_x select 0};

    // Show the user the dialog
    _dialogResult = [
        "Create Reinforcements",
        [
            ["Side", _poolNames, 0],
            ["Vehicle Type", ["Unarmed Light Transport", "APC's & Light Transport", "Dedicated Troop Transport", "IFV's & Heavy Transports", "Unarmed Helicopters", "Armed Helicopters", "Unarmed Boats", "Armed Boats"]]
        ]
    ] call Ares_fnc_ShowChooseDialog;

    if (_dialogResult isEqualTo []) exitWith{};

    // Get the data from the dialog to use when choosing what units to spawn
    _dialogResult params ["_dialogPool", "_dialogVehicleClass"];
    _spawnPosition = _this select 0;

    // To make sure that it can only be used for the PLA, because of crew vehicle
    if (_dialogPool != 5) exitWith {
        [objNull, "Only Used for PLA Forces"] call BIS_fnc_showCuratorFeedbackMessage;
    };

    // Get the unit pool and the side it's associated with
    _pool = _validPools select _dialogPool;
    _side = _pool select 1;

    if ((_pool select 11) isEqualTo []) exitWith {
        [objNull, "No infantry squads defined for side."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    // Spawn a vehicle, send it to the LZ and have it unload the troops before returning home and
    // deleting itself.
    _vehiclePoolIndex = _dialogVehicleClass + 3;

    if ((_pool select _vehiclePoolIndex) isEqualTo []) exitWith {
        [objNull, "Vehicle pool had no vehicles defined for this faction."] call BIS_fnc_showCuratorFeedbackMessage;
    };

    _vehPool = _pool select _vehiclePoolIndex;
    _vehNames = _vehPool apply {getText (configFile >> "CfgVehicles" >> _x >> "displayname")};

    // Show the user the dialog
    _dialog2Result = [
        "Choose Vehicle Type",
        [
            ["Type", _vehNames],
            ["Number of teams", ["0", "1", "2", "3", "4"]],
            ["Size of teams", ["3", "4", "5", "6"]]
        ]
    ] call Ares_fnc_ShowChooseDialog;

    if (_dialog2Result isEqualTo []) exitWith {};

    _dialog2Result params ["_dialog2Type", "_dialog2TeamNumber", "_dialog2TeamSize"];

    _vehicleType = _vehPool select _dialog2Type;
    _vehicleGroup = ([_spawnPosition, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle) select 2;

    {
        removeAllWeapons _x;
        removeAllItems _x;
        removeAllAssignedItems _x;
        removeUniform _x;
        removeVest _x;
        removeBackpack _x;
        removeHeadgear _x;
        removeGoggles _x;

        _x forceAddUniform "PLA_CombatUniform_SBCB";
        _x addItemToUniform "FirstAidKit";
        for "_i" from 1 to 2 do {_x addItemToUniform "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green";};
        _x addItemToUniform "VME_QBZ95_1_30Rnd_DBP10";
        _x addItemToUniform "SmokeShell";
        _x addVest "PLA_B04_RF";
        _x addItemToVest "VME_QBZ95_1_30Rnd_DBP10";
        _x addItemToVest "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green";
        _x addItemToVest "SmokeShell";
        for "_i" from 1 to 2 do {_x addItemToVest "HandGrenade";};
        _x addHeadgear "VME_PLA_Helmet";
        _x addWeapon "vme_pla_qbz95_1";
        _x linkItem "ItemMap";
        _x linkItem "ItemCompass";
        _x linkItem "ItemWatch";
        _x linkItem "ItemRadio";
        _x setFace "AsianHead_A3_w1";
        _x setSpeaker "Male01CHI";
    } forEach (crew (vehicle (leader _vehicleGroup)));

    // Add vehicle to curator
     [(units _vehicleGroup) + [vehicle (leader _vehicleGroup)]] call Ares_fnc_AddUnitsToCurator;

    // Spawn the units and load them into the vehicle
    _vehicle = vehicle (leader _vehicleGroup);
    _emptyPos = _vehicle emptyPositions "Cargo";
    _teamNumber = _dialog2TeamNumber;
    _teamSize = _dialog2TeamSize + 3;
    _num = _teamNumber;
    if ((_emptyPos / _teamSize) < _teamNumber) then {
        _num = (floor (_emptyPos / _teamSize)) max 1;
        [objNull, "Number of teams too big for vehicle, set to highest possible"] call BIS_fnc_showCuratorFeedbackMessage;
    };

    for "_i" from 1 to _num do {
        private _squadMembers = selectRandom (_pool select 11);
        if (count _squadMembers >= _teamSize) then {
            _squadMembers resize _teamSize;
        };
        _freeSpace = _vehicle emptyPositions "Cargo";
        if (_freeSpace < count _squadMembers) then {
            // Trim the squad size so they will fit.
            _squadMembers resize _freeSpace;
        };

        // Spawn the squad members.
        _infantryGroup = [_spawnPosition, _side, _squadMembers] call BIS_fnc_spawnGroup;

        {
            _x moveInCargo (vehicle (leader _vehicleGroup));
        } foreach (units _infantryGroup);

        // Add infantry to curator
        [units _infantryGroup] call Ares_fnc_AddUnitsToCurator;
    };
	["Arsenal", " Add 13th Arsenal",
	{
		params ["_pos","_object"];
		
		if (isNull _object) exitWith
		{
			[objnull, "No object under cursor."] call bis_fnc_showCuratorFeedbackMessage;
		};
		_dialogResult = ["Choose Arsenal Type",
			[
				["Type", ["Summer","Winter","Both"]]
			]
		] call Ares_fnc_ShowChooseDialog;

		if (_dialogResult isEqualTo []) exitWith{};
		
		_choice = ["summer","winter","both"] select (_dialogResult select 0);
		_arsenalData = [_choice] call TIAD_fnc_Arsenal;
		[_object, _arsenalData, true] call Ares_fnc_ArsenalSetup;
		[objNull, "Arsenal objects added."] call bis_fnc_showCuratorFeedbackMessage;
	}
	] call Ares_fnc_RegisterCustomModule;
	["Arsenal", " Add 13th Box Equipment",
	{
		params ["_pos","_object"];
		
		if (isNull _object) exitWith
		{
			[objnull, "No object under cursor."] call bis_fnc_showCuratorFeedbackMessage;
		};
		_null = [_object] execVM "scripts\box_equipment.sqf";
		[objNull, "Box Equipment added to object."] call bis_fnc_showCuratorFeedbackMessage;
	}
	] call Ares_fnc_RegisterCustomModule;
}] call Ares_fnc_RegisterCustomModule;
