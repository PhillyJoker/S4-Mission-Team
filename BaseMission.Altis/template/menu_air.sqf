/*
[] execVM "template\menu_air.sqf";
menu_air addAction ["Air Vehicle Menu", "template\menu_air.sqf", "init"];
*/
_s3passedArguement = _this select 3; 
_n_pos = getPosASL nimitz_1;
_n_pos_z = _n_pos select 2;
_n_sur = surfaceNormal position nimitz_1;
_obj_new = [];

    if (_s3passedArguement == "init") then
    {
    removeAllActions menu_air;
    menu_air addAction ["Build CH-53", "template\menu_air.sqf", "buildCH53"];
    menu_air addAction ["Build F/A-18", "template\menu_air.sqf", "buildFA18"];
    menu_air addAction ["Build AH-1Z", "template\menu_air.sqf", "buildAH1Z"];
    menu_air addAction ["Build UH-1Y", "template\menu_air.sqf", "buildUH1Y"];
    menu_air addAction ["Delete Vehicle", "template\menu_air.sqf", "delete_any"];
    menu_air addAction ["-----------",""];
    menu_air addAction ["Close Air Vehicle Menu", "template\menu_air.sqf", "end"];
    };
    
    if (_s3passedArguement == "end") then
    {
    removeAllActions menu_air;
    menu_air addAction ["Air Vehicle Menu", "template\menu_air.sqf", "init"];
    };
    if (_s3passedArguement == "delete_any") then
    {
        _spCheck = nearestObjects[(getPosASL air_check),["AllVehicles"],9]; 
        {deleteVehicle _x}forEach _spCheck;
    };
    
if ((air_check distance nearestObject [air_check,"AllVehicles"]) > 5) then
{
    if (_s3passedArguement == "buildCH53") then
    {
        _build = ['rhsusf_CH53E_USMC',12,-22.5,17.5,0];
        _build params ["_type", "_obj_x", "_obj_y", "_obj_z", "_obj_d"];
        _obj_new = createVehicle [_type, [0, 0, 0], [], 0, 'CAN_COLLIDE'];
        [nimitz_1, _obj_new,[_obj_x,_obj_y,_obj_z],_obj_d] call BIS_fnc_relPosObject;
        _obj_new enableSimulationGlobal true;
        _obj_rel = getPosASL _obj_new;
        _obj_rel_x = _obj_rel select 0;
        _obj_rel_y = _obj_rel select 1;
        _obj_new setPosASL [(_obj_rel_x), (_obj_rel_y), (_n_pos_z)+_obj_z];
        _obj_new setVectorUp [0,0,1];
    };
    if (_s3passedArguement == "buildFA18") then
    {
        _build = ['JS_JC_FA18E',12,-22.5,17.5,0];
        _build params ["_type", "_obj_x", "_obj_y", "_obj_z", "_obj_d"];
        _obj_new = createVehicle [_type, [0, 0, 0], [], 0, 'CAN_COLLIDE'];
        [nimitz_1, _obj_new,[_obj_x,_obj_y,_obj_z],_obj_d] call BIS_fnc_relPosObject;
        _obj_new enableSimulationGlobal true;
        _obj_rel = getPosASL _obj_new;
        _obj_rel_x = _obj_rel select 0;
        _obj_rel_y = _obj_rel select 1;
        _obj_new setPosASL [(_obj_rel_x), (_obj_rel_y), (_n_pos_z)+_obj_z];
        _obj_new setVectorUp [0,0,1];
    };
    if (_s3passedArguement == "buildAH1Z") then
    {
        _build = ['RHS_AH1Z',12,-22.5,17.5,0];
        _build params ["_type", "_obj_x", "_obj_y", "_obj_z", "_obj_d"];
        _obj_new = createVehicle [_type, [0, 0, 0], [], 0, 'CAN_COLLIDE'];
        [nimitz_1, _obj_new,[_obj_x,_obj_y,_obj_z],_obj_d] call BIS_fnc_relPosObject;
        _obj_new enableSimulationGlobal true;
        _obj_rel = getPosASL _obj_new;
        _obj_rel_x = _obj_rel select 0;
        _obj_rel_y = _obj_rel select 1;
        _obj_new setPosASL [(_obj_rel_x), (_obj_rel_y), (_n_pos_z)+_obj_z];
        _obj_new setVectorUp [0,0,1];
    };
    if (_s3passedArguement == "buildUH1Y") then
    {
        _build = ['RHS_UH1Y',12,-22.5,17.5,0];
        _build params ["_type", "_obj_x", "_obj_y", "_obj_z", "_obj_d"];
        _obj_new = createVehicle [_type, [0, 0, 0], [], 0, 'CAN_COLLIDE'];
        [nimitz_1, _obj_new,[_obj_x,_obj_y,_obj_z],_obj_d] call BIS_fnc_relPosObject;
        _obj_new enableSimulationGlobal true;
        _obj_rel = getPosASL _obj_new;
        _obj_rel_x = _obj_rel select 0;
        _obj_rel_y = _obj_rel select 1;
        _obj_new setPosASL [(_obj_rel_x), (_obj_rel_y), (_n_pos_z)+_obj_z];
        _obj_new setVectorUp [0,0,1];
    };
};    