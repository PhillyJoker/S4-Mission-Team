/*
[] execVM "template\menu_air.sqf";
menu_ground addAction ["Air Vehicle Menu", "template\menu_ground.sqf", "init"];
*/
private _s3passedArguement = toLower param [3];

if (_s3passedArguement == "init") exitWith {
    removeAllActions menu_ground;
    menu_ground addAction ["Build RG-33", "template\menu_ground.sqf", "buildRG33"];
    menu_ground addAction ["Build RG-33 (M-2)", "template\menu_ground.sqf", "buildRG33M2"];
    menu_ground addAction ["Build M1A1", "template\menu_ground.sqf", "buildM1A1"];
    menu_ground addAction ["Build LAV", "template\menu_ground.sqf", "buildLAV"];
    menu_ground addAction ["Delete Vehicle", "template\menu_ground.sqf", "delete_any"];
    menu_ground addAction ["-----------", ""];
    menu_ground addAction ["Close Ground Vehicle Menu", "template\menu_ground.sqf", "end"];
};

if (_s3passedArguement == "end") exitWith {
    removeAllActions menu_ground;
    menu_ground addAction ["Ground Vehicle Menu", "template\menu_ground.sqf", "init"];
};

if (_s3passedArguement == "delete_any") exitWith {
    private _spCheck = nearestObjects [getPos ground_check, ["AllVehicles"], 5];
    {deleteVehicle _x} forEach _spCheck;
};

private _season = MRB_templateSeason;
private _obj_pos = getPos ground_check;
private _obj_dir = getDir ground_check;

private "_newVehicle";
if ((ground_check distance nearestObject [ground_check, "AllVehicles"]) > 5) then {
    if (_s3passedArguement == "buildRG33") then {
        if (_season == "winter") then {
            _newVehicle = createVehicle ['rhsusf_rg33_usmc_wd', _obj_pos, [], 0, 'CAN_COLLIDE'];
            _newVehicle setDir _obj_dir;
        };
        if (_season == "summer") then {
            _newVehicle = createVehicle ['rhsusf_rg33_usmc_d', _obj_pos, [], 0, 'CAN_COLLIDE'];
            _newVehicle setDir _obj_dir;
        };
    };
    if (_s3passedArguement == "buildRG33M2") then {
        if (_season == "winter") then {
            _newVehicle = createVehicle ['rhsusf_rg33_m2_usmc_wd', _obj_pos, [], 0, 'CAN_COLLIDE'];
            _newVehicle setDir _obj_dir;
        };
        if (_season == "summer") then {
            _newVehicle = createVehicle ['rhsusf_rg33_m2_usmc_d', _obj_pos, [], 0, 'CAN_COLLIDE'];
            _newVehicle setDir _obj_dir;
        };
    };
    if (_s3passedArguement == "buildM1A1") then {
        if (_season == "winter") then {
            _newVehicle = createVehicle ['rhsusf_m1a1fep_d', _obj_pos, [], 0, 'CAN_COLLIDE'];
            _newVehicle setDir _obj_dir;
            _newVehicle animate ['IFF_Panels_Hide', 1, true];
            _newVehicle animate ['Duke_Hide', 1, true];
            _newVehicle removeMagazineTurret ["rhs_mag_M829A3", [0]];
            _newVehicle removeMagazineTurret ["rhs_mag_M829A1", [0]];
            _newVehicle removeMagazineTurret ["rhs_mag_M830A1", [0]];
            _newVehicle addMagazineTurret ["rhs_mag_M829A3", [0], 28];
            _newVehicle addMagazineTurret ["rhs_mag_M830A1", [0], 10];
            _newVehicle addMagazineTurret ["rhs_mag_M1069", [0], 6];
        };
        if (_season == "summer") then {
            _newVehicle = createVehicle ['rhsusf_m1a1fep_d', _obj_pos, [], 0, 'CAN_COLLIDE'];
            _newVehicle setDir _obj_dir;
            _newVehicle animate ['IFF_Panels_Hide', 1, true];
            _newVehicle animate ['Duke_Hide', 1, true];
            _newVehicle setObjectTextureGlobal [0, "rhsusf\addons\rhsusf_m1a1\data\rhsusf_m1a1aim_d_01.rvmat"];
            _newVehicle setObjectTextureGlobal [1, "rhsusf\addons\rhsusf_m1a1\data\rhsusf_m1a1aim_d_01.rvmat"];
            _newVehicle setObjectTextureGlobal [2, "rhsusf\addons\rhsusf_m1a1\data\rhsusf_m1a1aim_d_01.rvmat"];
            _newVehicle setObjectTextureGlobal [3, "rhsusf\addons\rhsusf_m1a1\data\rhsusf_m1a1aim_d_01.rvmat"];
            _newVehicle setObjectTextureGlobal [4, "rhsusf\addons\rhsusf_m1a1\data\rhsusf_m1a1aim_d_01.rvmat"];
            _newVehicle removeMagazineTurret ["rhs_mag_M829A3", [0]];
            _newVehicle removeMagazineTurret ["rhs_mag_M829A1", [0]];
            _newVehicle removeMagazineTurret ["rhs_mag_M830A1", [0]];
            _newVehicle addMagazineTurret ["rhs_mag_M829A3", [0], 28];
            _newVehicle addMagazineTurret ["rhs_mag_M830A1", [0], 10];
            _newVehicle addMagazineTurret ["rhs_mag_M1069", [0], 6];
        };
    };
    if (_s3passedArguement == "buildLAV") then {
        if (_season == "winter") then {
            _newVehicle = createVehicle ['Cha_LAV25', _obj_pos, [], 0, 'CAN_COLLIDE'];
            [_newVehicle] call MRB_fnc_lavLoadout;
            _newVehicle setDir _obj_dir;
        };
        if (_season == "summer") then {
            _newVehicle = createVehicle ['Cha_Des1_LAV25', _obj_pos, [], 0, 'CAN_COLLIDE'];
            [_newVehicle] call MRB_fnc_lavLoadout;
            _newVehicle setDir _obj_dir;
        };
    };
};