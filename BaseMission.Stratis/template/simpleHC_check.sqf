params ["_s3passedArguement"];

_allNonEmptyGroups = allGroups select {count (units _x) > 0};

switch (toLower _s3passedArguement) do {
    case "displayhc": {
        Pub_HCOwner = [owner HC_1, 2] select (isNil "HC_1");
        publicVariable "Pub_HCOwner";
    };
    case "displayhc2": {
        Pub_HCOwner2 = [owner HC_2, 2] select (isNil "HC_2");
        publicVariable "Pub_HCOwner2";
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
