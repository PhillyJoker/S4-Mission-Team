/*
tccc_1 addAction ["Open Testing Menu", "template\tccc_menu.sqf", "init"];
*/

_s3passedArguement = _this select 3;

if (_s3passedArguement == "init") then
{
removeAllActions tccc_1;
tccc_1 addAction ["Build COP Red October", "template\tccc_menu.sqf", "buildRO"];
tccc_1 addAction ["Delete COP Red October", "template\tccc_menu.sqf", "deleteRO"];
tccc_1 addAction ["-----------", ""];
tccc_1 addAction ["Close Mission Menu", "template\tccc_menu.sqf", "end"];
};

if (_s3passedArguement == "end") then
{
removeAllActions tccc_1;
tccc_1 addAction ["Open Mission Menu", "template\tccc_menu.sqf", "init"];
};

if (_s3passedArguement == "buildRO") then
{
    if (player distance (getMarkerpos "cop_redoctober_no") > 201) then
    {
        if (alive remoteBuilder) then
        {
            [["buildRO"], "template\tccc_builder.sqf"] remoteExec ["execVM", 2];
            Hint "COP Red October built!";
        };
        if (!alive remoteBuilder) then
        {
            Hint "COP Red October already exists! Check your map.";
        };
    };
    if (player distance (getMarkerpos "cop_redoctober_no") < 200) then
    {
        Hint "Player(s) within 200m of the COP. They must construct COP Red October themselves.";
    };
removeAllActions tccc_1;
tccc_1 addAction ["Open Mission Menu", "template\tccc_menu.sqf", "init"];
};

if (_s3passedArguement == "buildROremote") then
{
    [["buildRO"], "template\tccc_builder.sqf"] remoteExec ["execVM", 2];
    Hint "COP Red October built!";
    removeAllActions tccc_1;
    tccc_1 addAction ["Open Mission Menu", "template\tccc_menu.sqf", "init"];
};


if (_s3passedArguement == "deleteRO") then
{
    if (player distance (getMarkerpos "cop_redoctober") > 201) then
    {
        [["deleteRO"], "template\tccc_builder.sqf"] remoteExec ["execVM", 2];
        Hint "COP Red October Deleted";
    };
    if (player distance (getMarkerpos "cop_redoctober") < 200) then
    {
        Hint "There is a Player within 200m of the COP. Wait until they have moved out!";
    };
removeAllActions tccc_1;
tccc_1 addAction ["Open Mission Menu", "template\tccc_menu.sqf", "init"];
};    