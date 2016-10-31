/*

*/
_s3passedArguement = _this select 0;

if (_s3passedArguement == "displayHC") then
{
    _HCid = if (isNil "HC_1") then {2} else {owner HC_1;};
    Pub_HCOwner = _HCid;
    publicVariable "Pub_HCOwner";
};
if (_s3passedArguement == "displayHC2") then
{
    _HCid2 = if (isNil "HC_2") then {2} else {owner HC_2;};
    Pub_HCOwner2 = _HCid2;
    publicVariable "Pub_HCOwner2";
};
if (_s3passedArguement == "displayPC") then
{
    _PlayerGroups = [];
    _PlayerOwners = [];
    {if ({isPlayer _x} count units _x > 0) then {_PlayerGroups pushBack _x;}} forEach allGroups;
    {_PlayerOwners pushback groupOwner _x;} forEach _playerGroups;
    Pub_PlayerOwners = _PlayerOwners;
    publicVariable "Pub_PlayerOwners";
};
if (_s3passedArguement == "displayAI") then
{
    _AIGroups = [];
    _AIOwners = [];
    {if (({isPlayer _x} count units _x == 0) and (count (units _x)>0)) then {_AIGroups pushBack _x;}} forEach allGroups;
    {_AIOwners pushback groupOwner _x;} forEach _AIGroups;
    Pub_AIOwners = _AIOwners;
    publicVariable "Pub_AIOwners";
};
if (_s3passedArguement == "displayAIgroup") then
{
    _AIGroups = [];
    {if (({isPlayer _x} count units _x == 0) and (count (units _x)>0)) then {_AIGroups pushBack _x;}} forEach allGroups;
    Pub_AIGroups = _AIGroups;
    publicVariable "Pub_AIGroups";
};
if (_s3passedArguement == "displayAres") then
{
    _AresOwner = if (isNil "aresmod") then {2} else {owner aresmod;};
    Pub_AresOwner = _AresOwner;
    publicVariable "Pub_AresOwner";
};



