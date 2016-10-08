/*
CHANGELOG

06JAN14
- Changed to patchless uniform

09MAR15
- Changed to 101st uniform
*/


     
if (!local player) exitWith {};
     
removeallweapons player;
removeallassigneditems player;
removeuniform player;
removevest player;
removebackpack player;
removeheadgear player;
removebackpack player;
removegoggles player;
player adduniform "rhs_uniform_FROG01_wd";

