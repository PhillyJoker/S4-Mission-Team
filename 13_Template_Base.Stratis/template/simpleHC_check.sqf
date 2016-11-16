/*
emptyGroup = execVM "scripts\simpleHCgroup.sqf";
*/

params ["_s3passedArguement"];

_allNonEmptyGroups = allGroups select {count (units _x) > 0};

switch (toLower _s3passedArguement) do {
    case "displayhc": {
        _HCid1 = if (isNil "HC_1") then {2} else {owner HC_1;};
		_HCid2 = if (isNil "HC_2") then {2} else {owner HC_2;};
		_HCid3 = if (isNil "HC_3") then {2} else {owner HC_3;};
		_HCid = [_HCid1,_HCid2,_HCid3];
		Pub_HCOwner = _HCid;
        publicVariable "Pub_HCOwner";
    };
    case "displaypc": {
        _playerGroups = _allNonEmptyGroups select {{isPlayer _x} count units _x > 0};
        Pub_PlayerOwners = _playerGroups apply {groupOwner _x};
        publicVariable "Pub_PlayerOwners";
    };
    case "displayai": {
        _AIGroups = _allNonEmptyGroups select {{isPlayer _x} count units _x == 0};
        Pub_AIOwners = _AIGroups apply {groupOwner _x};
        publicVariable "Pub_AIOwners";
    };
    case "displayaigroup": {
        Pub_AIGroups = _allNonEmptyGroups select {{isPlayer _x} count units _x == 0};
        publicVariable "Pub_AIGroups";
    };
    case "displayares": {
        Pub_AresOwner = [owner aresmod, 2] select (isNil "aresmod");
        publicVariable "Pub_AresOwner";
    };
};
