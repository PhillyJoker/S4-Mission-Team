/*
emptyGroup = execVM "scripts\simpleHC_check.sqf";
*/

#define GET_HC(ID) if (isNil #ID) then {2} else {owner ID} 

params ["_s3passedArguement"];

_allNonEmptyGroups = allGroups select {count (units _x) > 0};

switch (toLower _s3passedArguement) do {
    case "displayhc": {
        Pub_HCOwner = [GET_HC(HC_1), GET_HC(HC_2), GET_HC(HC_3)];
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
    };
    case "displayares": {
        Pub_AresOwner = [owner aresmod, 2] select (isNil "aresmod");
        publicVariable "Pub_AresOwner";
    };
};
