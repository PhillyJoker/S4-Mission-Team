/*
tccc addAction ["Open Testing Menu", "template\ryan_menu.sqf", "init"];
*/

_s3passedArguement = toLower param [3];
_s3curators = allCurators; //gets the name of CuratorModule_F (aresmod, aresmod_1, or aresmod_2)
_s3logic = getAssignedCuratorLogic player; //gets the name of CuratorModule_F assigned to player (if any) - checks if player is zeus

if !(_s3logic in _s3curators) exitWith {
    hint "You are not in a Zeus slot, access denied."
};

switch (_s3passedArguement) do {
    case "init" : {
        removeAllActions tccc;
        tccc addAction ["Display HC Owner(s)", "template\ryan_menu.sqf", "displayhc"];
        tccc addAction ["Display Player Owners", "template\ryan_menu.sqf", "displaypc"];
        tccc addAction ["All AI Owners", "template\ryan_menu.sqf", "displayai"];
        tccc addAction ["All AI Groups", "template\ryan_menu.sqf", "displayaigroup"];
        tccc addAction ["Ares Owner", "template\ryan_menu.sqf", "displayares"];
        tccc addAction ["Remove Options", "template\ryan_menu.sqf", "removeaction"];
    };
    case "removeaction" : {
        removeAllActions tccc;
        tccc addAction ["Open Testing Menu", "template\ryan_menu.sqf", "init"];
    };
    default {
        [_s3passedArguement, clientOwner] remoteExec ["MEU_fnc_debug", 2];
    };
};
