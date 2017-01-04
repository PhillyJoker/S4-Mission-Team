// this addAction ["Clear Loadout", MRB_fnc_clearLoadout, [], 6, true, true, "", "true", 5];

#include "\mrb_mod\script_component.hpp"

CLIENT_ONLY;

removeAllWeapons player;
removeAllAssignedItems player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeBackpack player;
removeGoggles player;

private _uniform = uniform player;
removeUniform player;
player addUniform _uniform;
