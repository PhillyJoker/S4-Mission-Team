// this addAction ["Clear Loadout", "scripts\clear_loadout.sqf", [], 6, true, true, "", "_this distance _target < 5"];

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
