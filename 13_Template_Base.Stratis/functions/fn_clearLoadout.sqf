// this addAction ["Clear Loadout", MEU_fnc_clearLoadout, [], 6, true, true, "", "true", 5];

if (!hasInterface) exitWith {
    diag_log format [
        "[13th MEU] ERROR: Non-client call to file %1 in mission %2 - file is marked CLIENT_ONLY!",
        __FILE__, missionName
    ]
};

removeAllWeapons player;
removeAllAssignedItems player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeBackpack player;
removeGoggles player;

_uniform = uniform player;
removeUniform player;
player addUniform _uniform;
