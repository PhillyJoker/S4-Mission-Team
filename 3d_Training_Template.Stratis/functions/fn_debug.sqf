#define GET_HC(ID) if (isNil #ID) then {2} else {owner ID}
#define HAS_PLAYER(GRP) ({isPlayer _x} count units GRP > 0)

params ["_s3passedArguement", "_caller"];

private _allNonEmptyGroups = allGroups select {count (units _x) > 0};

private _msg = switch (_s3passedArguement) do {
    case "displayhc": {
        private _HCOwner = [GET_HC(HC_1), GET_HC(HC_2), GET_HC(HC_3)];
        [_HCOwner, "No Headless Client is connected."] select (_HCOwner isEqualTo [2, 2, 2]);
    };
    case "displaypc": {
        private _playerGroups = _allNonEmptyGroups select {HAS_PLAYER(_x)};
        _playerGroups apply {groupOwner _x};
    };
    case "displayai": {
        private _AIGroups = _allNonEmptyGroups select {!HAS_PLAYER(_x)};
        _AIGroups apply {groupOwner _x};
    };
    case "displayaigroup": {
        _allNonEmptyGroups select {!HAS_PLAYER(_x)};
    };
    case "displayares": {
        if (isNil "aresmod") then {2} else {owner aresmod};
    };
};

if !(_msg isEqualType "") then {
    _msg = str _msg;
};
_msg remoteExec ["hint", _caller];
