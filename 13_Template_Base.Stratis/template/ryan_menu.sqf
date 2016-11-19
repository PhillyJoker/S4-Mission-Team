/*
tccc addAction ["Open Testing Menu", "template\ryan_menu.sqf", "init"];
*/
_s3passedArguement = _this select 3;
_s3curators = allCurators; //gets the name of CuratorModule_F (aresmod, aresmod_1, or aresmod_2)
_s3logic = getAssignedCuratorLogic player; //gets the name of CuratorModule_F assigned to player (if any) - checks if player is zeus

if (_s3logic in _s3curators) then
{
    if (_s3passedArguement == "init") then
    {
        removeAllActions tccc;
        tccc addAction ["Display HC Owner(s)", "template\ryan_menu.sqf", "displayHC"];
        tccc addAction ["Display Player Owners", "template\ryan_menu.sqf", "displayPC"];
        tccc addAction ["All AI Owners", "template\ryan_menu.sqf", "displayAI"];
        tccc addAction ["All AI Groups", "template\ryan_menu.sqf", "displayAIgroup"];
        tccc addAction ["Ares Owner", "template\ryan_menu.sqf", "displayAres"];
        tccc addAction ["Remove Options", "template\ryan_menu.sqf", "removeAction"];
    };

    if (_s3passedArguement == "displayHC") then
    {
		[["displayHC"], "template\simpleHC_check.sqf"] remoteExec ["execVM", 2];
		waitUntil {!isNil "Pub_HCOwner"};
		if (Pub_HCOwner isEqualTo [2,2,2]) then {
            hint "No Headless Client is connected.";
        } else {
            hint str Pub_HCOwner;
        };
        Pub_HCOwner = nil;
    };
    if (_s3passedArguement == "displayPC") then
    {
        [["displayPC"], "template\simpleHC_check.sqf"] remoteExec ["execVM", 2];
        waitUntil {!isNil "Pub_PlayerOwners"};
        hint str Pub_PlayerOwners;
        Pub_PlayerOwners = nil;
    };
    if (_s3passedArguement == "displayAI") then
    {
        [["displayAI"], "template\simpleHC_check.sqf"] remoteExec ["execVM", 2];
        waitUntil {!isNil "Pub_AIOwners"};
        hint str Pub_AIOwners;
        Pub_AIOwners = nil;
    };
    if (_s3passedArguement == "displayAIgroup") then
    {
        ["displayAIgroup"] execVM "template\simpleHC_check.sqf";
        waitUntil {!isNil "Pub_AIGroups"};
        hint str Pub_AIGroups;
        Pub_AIGroups = nil;
    };
    if (_s3passedArguement == "displayAres") then
    {
        [["displayAres"], "template\simpleHC_check.sqf"] remoteExec ["execVM", 2];
        waitUntil {!isNil "Pub_AresOwner"};
        hint str Pub_AresOwner;
        Pub_AresOwner = nil;
    };
    if (_s3passedArguement == "removeAction") then
    {
        removeAllActions tccc;
        tccc addAction ["Open Testing Menu", "template\ryan_menu.sqf", "init"]
    };
} else {
    hint "You are not in the Zeus Slot, Access Denied."
};
