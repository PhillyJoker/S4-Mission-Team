/*
[] execVM "template\menu_air_main.sqf";
menu_air_main addAction ["Air Vehicle Menu", "template\menu_air_main.sqf", "init"];
*/
#define ADD_ACT(DNAME,ARGS,PRIO) menu_air_main addAction [DNAME,"template\menu_air_main.sqf",ARGS,PRIO,true,false,"","true",5]

_s3passedArguement = toLower (_this select 3);

if (_s3passedArguement == "init") exitWith {
    removeAllActions menu_air_main;
    ADD_ACT("Build CH-53","buildch53",10);
    ADD_ACT("Build F/A-18","buildfa18",9);
    ADD_ACT("Build AH-1Z","buildah1z",8);
    ADD_ACT("Build UH-1Y","builduh1y",7);
    ADD_ACT("Delete Vehicle","delete_any",6);
    menu_air_main addAction ["-----------", "", nil, 5, true, false, "", "true", 5];
    ADD_ACT("Close Air Vehicle Menu","end",4);
};

if (_s3passedArguement == "end") exitWith {
    removeAllActions menu_air_main;
    menu_air_main addAction ["Air Vehicle Menu", "template\menu_air_main.sqf", "init"];
};
if (_s3passedArguement == "delete_any") exitWith {
    _spCheck = nearestObjects [getPosASL air_check_main, ["AllVehicles"], 9];
    {deleteVehicle _x} forEach _spCheck;
};

if ((air_check_main distance nearestObject [air_check_main, "AllVehicles"]) <= 5) exitWith {};

_class = (switch (_s3passedArguement) do {
    case "buildch53": {"rhsusf_CH53E_USMC"};
    case "buildfa18": {"JS_JC_FA18E"};
    case "buildah1z": {"RHS_AH1Z"};
    case "builduh1y": {"RHS_UH1Y"};
});

_veh = objNull;
_veh = createVehicle [_class, [0, 0, 0], [], 0, "CAN_COLLIDE"];
[air_check_main, _veh, [0, 0, 0], 0, false, true] call BIS_fnc_relPosObject;
_veh setDir (getDir air_check_main);