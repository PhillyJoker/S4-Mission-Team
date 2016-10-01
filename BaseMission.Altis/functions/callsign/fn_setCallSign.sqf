_callSign = ctrlText 13;

_callSigns = allGroups apply {toLower groupId _x};

if ((toLower _callSign) in _callSigns) exitWith {
    hint "THAT CALL SIGN IS ALREADY IN USE!";
};

hint format ["NEW CALLSIGN ""%1"" SET", _callSign];

player setGroupIdGlobal [_callSign];
profileNamespace setVariable ["MEU_callSign", _callSign];
