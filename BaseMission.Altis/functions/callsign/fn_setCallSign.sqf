_callSign = ctrlText 13;

_callSigns = allGroups apply {toLower groupId _x};
_callSigns = _callSigns - [toLower groupId group player];

_i = _callSigns find (toLower _callSign);
if (_i != -1 && {(count units ((allGroups - [group player]) select _i)) > 0}) exitWith {
    hint format ["CALL SIGN ""%1"" IS ALREADY IN USE!", _callSign];
};

hint format ["NEW CALLSIGN ""%1"" SET", _callSign];

player setGroupIdGlobal [_callSign];
profileNamespace setVariable ["MEU_callSign", _callSign];
