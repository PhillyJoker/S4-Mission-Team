/*
 * Version 2
 * By Ryan [506th IR], v2 by Miles [13th MEU]
 * Simple script to delete empty group's on a Headless Client.
 * Place the following in init of the HC:
 *
 * call MRB_fnc_deleteEmptyGroups;
 */

[{
    {
        if (local _x && {units _x isEqualTo []}) then {
            deleteGroup _x;
        };
    } forEach allGroups;
}, 300] call CBA_fnc_addPerFrameHandler;
