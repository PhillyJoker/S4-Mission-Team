/*
tccc addAction ["Open Testing Menu", "template\ryan_menu.sqf", "init"];
*/
_s3passedArguement = _this select 3; 
_s3curators = allCurators; //gets the name of CuratorModule_F (aresmod,aresmod_1, or aresmod_2)
_s3logic = getAssignedCuratorLogic player; //gets the name of CuratorModule_F assigned to player (if any) - checks if player is zeus

if (_s3logic in _s3curators) then 
{
    if (_s3passedArguement == "init") then
    {
    removeAllActions tccc;
    tccc addAction ["Display HC Owner", "template\ryan_menu.sqf","displayHC"];
    tccc addAction ["Display HC Owner 2", "template\ryan_menu.sqf","displayHC2"];
    tccc addAction ["Display Player Owners", "template\ryan_menu.sqf","displayPC"];
    tccc addAction ["All AI Owners", "template\ryan_menu.sqf","displayAI"];
    tccc addAction ["All AI Groups", "template\ryan_menu.sqf","displayAIgroup"];
    tccc addAction ["Ares Owner", "template\ryan_menu.sqf","displayAres"];
    tccc addAction ["Remove Options", "template\ryan_menu.sqf","removeAction"];
    };
    
    if (_s3passedArguement == "displayHC") then
    {
        [["displayHC"],"template\simpleHC_check.sqf"] remoteExec ["execVM",2];
        sleep 2;
        if (Pub_HCOwner == 2) then {Hint str "HC_1 is not connected.";} else {Hint str Pub_HCOwner;};
    };
    if (_s3passedArguement == "displayHC2") then
    {
        [["displayHC2"],"template\simpleHC_check.sqf"] remoteExec ["execVM",2];
        sleep 2;
        if (Pub_HCOwner2 == 2) then {Hint str "HC_2 is not connected.";} else {Hint str Pub_HCOwner2;};
    };
    if (_s3passedArguement == "displayPC") then
    {
        [["displayPC"],"template\simpleHC_check.sqf"] remoteExec ["execVM",2];
        sleep 2;
        Hint str Pub_PlayerOwners;
    };
    if (_s3passedArguement == "displayAI") then
    {
        [["displayAI"],"template\simpleHC_check.sqf"] remoteExec ["execVM",2];
        sleep 2;
        Hint str Pub_AIOwners;
    };
    if (_s3passedArguement == "displayAIgroup") then
    {
        [["displayAIgroup"],"template\simpleHC_check.sqf"] remoteExec ["execVM",2];
        sleep 2;
        Hint str Pub_AIGroups;
    };
    if (_s3passedArguement == "displayAres") then
    {
        [["displayAres"],"template\simpleHC_check.sqf"] remoteExec ["execVM",2];
        sleep 2;
        Hint str Pub_AresOwner;
    };
    if (_s3passedArguement == "removeAction") then
    {
    removeAllActions tccc;
    tccc addAction ["Open Testing Menu", "template\ryan_menu.sqf", "init"]
    };
} 
else 
{
    Hint "You are not in the Zeus Slot, Access Denied."
};