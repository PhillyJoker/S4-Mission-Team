/*
this addAction ["Clear Loadout", "scripts\clear_loadout.sqf", [],6,true,true,"","_this distance _target < 5"];
*/

_uniform = uniform player;

removeAllWeapons player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeBackpack player;
removeGoggles player;
player addUniform _uniform;
