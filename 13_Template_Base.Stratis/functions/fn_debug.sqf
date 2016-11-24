#define GET_HC(ID) if (isNil #ID) then {2} else {owner ID}
#define HAS_PLAYER(GRP) ({isPlayer _x} count units GRP > 0)

params ["_s3passedArguement", "_caller"];

private _allNonEmptyGroups = allGroups select {count (units _x) > 0};

private _fnc_hint = {
    params ["_arg", "_target"];
    if !(_arg isEqualType "") then {
        _arg = str _arg;
    };
    _arg remoteExec ["hint", _target];
};

(switch (_s3passedArguement) do {
    case "displayhc": {
        private _HCOwner = [GET_HC(HC_1), GET_HC(HC_2), GET_HC(HC_3)];
        private _msg = [_HCOwner, "No Headless Client is connected."] select (_HCOwner isEqualTo [2, 2, 2]);
        [_msg, _caller];
    };
    case "displaypc": {
        private _playerGroups = _allNonEmptyGroups select {HAS_PLAYER(_x)};
        [_playerGroups apply {groupOwner _x}, _caller];
    };
    case "displayai": {
        private _AIGroups = _allNonEmptyGroups select {!HAS_PLAYER(_x)};
        [_AIGroups apply {groupOwner _x}, _caller];
    };
    case "displayaigroup": {
        private _AIGroups = _allNonEmptyGroups select {!HAS_PLAYER(_x)};
        [_AIGroups, _caller];
    };
    case "displayares": {
        private _aresOwner = if (isNil "aresmod") then {2} else {owner aresmod};
        [_aresOwner, _caller];
    };
}) call _fnc_hint;
