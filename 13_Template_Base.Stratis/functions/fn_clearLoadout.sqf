// this addAction ["Clear Loadout", MEU_fnc_clearLoadout, [], 6, true, true, "", "true", 5];

#include "\meu_mod\script_macros.hpp"

CLIENT_ONLY;

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
