/*
In the initServer.sqf:
[] execVM "template\base_setup.sqf";
*/
if (isServer) then 
{
_n_pos = getPosASL nimitz_1;
_n_pos_z = _n_pos select 2;
_n_sur = surfaceNormal position nimitz_1;
_obj_new = [];
_b_list = 
[
['rhsusf_CH53E_USMC',-30,-80,17.5,0,"ch_53"],
['rhsusf_CH53E_USMC',-30,-45,17.5,0,"ch_53"],
['RHS_AH1Z',28,-118,17.5,330,"nothing_s"],
['RHS_AH1Z',27,-135,17.5,330,"nothing_s"],
['RHS_UH1Y',-13,-160,17.5,35,"uh_1y"],
['RHS_UH1Y',-14,-145,17.5,35,"uh_1y"],
['JS_JC_FA18E',20,45,17.5,-5,"nothing_s"],
['JS_JC_FA18E',-2,42,17.5,-1,"nothing_s"],
['Land_InfoStand_V1_F',25,-43,17.5,0,"menu_air"],
['Land_InfoStand_V1_F',1,-40,7,180,"menu_build"],
['Land_InfoStand_V1_F',-1,-40,7,180,"menu_hc"],
['Land_Flush_Light_yellow_F',7,-35,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',9,-35,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',11,-35,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',13,-35,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',15,-35,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',17,-35,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',17,-30,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',17,-25,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',17,-20,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',17,-15,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',17,-10,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',15,-10,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',13,-10,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',11,-10,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',9,-10,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',7,-10,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',7,-15,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',7,-20,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',7,-25,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',7,-30,17.4,0,"nothing_s"],
['Land_Flush_Light_yellow_F',7,-35,17.4,0,"nothing_s"],
['Land_PortableLight_double_F',15,-10,7,45,"nothing_s"],
['Land_PortableLight_double_F',-15,-10,7,-45,"nothing_s"],
['Land_PortableLight_double_F',15,-75,7,135,"nothing_s"],
['Land_PortableLight_double_F',-15,-75,7,-135,"nothing_s"],
['Land_Flush_Light_yellow_F',12,-22.5,17.4,0,"air_check"],
['Flag_US_F',+31,-68,17.5,0,"tp_f_1"],
['Box_NATO_AmmoVeh_F',5,-40,7.1,0,"arsenal_0"],
['Box_NATO_AmmoVeh_F',-5,-40,7.1,0,"arsenal_00"],
['B_CargoNet_01_ammo_F',10,-40,7,0,"equipment_0"],
['B_CargoNet_01_ammo_F',-10,-40,7,0,"equipment_00"],
['B_Slingload_01_Ammo_F',35,-100,17.5,0,"resupply_veh"],
['B_CargoNet_01_ammo_F',25,-95,17.5,0,"resupply_0"],
['B_CargoNet_01_ammo_F',25,-105,17.5,0,"resupply_0"]
];

{
_type = _x select 0;
_obj_x = _x select 1;
_obj_y = _x select 2;
_obj_z = _x select 3;
_obj_d = _x select 4;
_obj_s = _x select 5;
_obj_new = createVehicle [_type, [0, 0, 0], [], 0, 'CAN_COLLIDE'];
[nimitz_1, _obj_new,[_obj_x,_obj_y,_obj_z],_obj_d] call BIS_fnc_relPosObject;
_obj_new enableSimulationGlobal true;
_obj_rel = getPosASL _obj_new;
_obj_rel_x = _obj_rel select 0;
_obj_rel_y = _obj_rel select 1;
_obj_new setPosASL [(_obj_rel_x), (_obj_rel_y), (_n_pos_z)+_obj_z];
_obj_new setVectorUp [0,0,1];
if(_obj_s != "nothing_s") then 
{
	if(_obj_s == "ch_53") then {_obj_new animateDoor ["mainRotor_folded", 1, true];};
	
	if(_obj_s == "uh_1y") then {[_obj_new] call ace_fastroping_fnc_equipFRIES;};
	
	if(_obj_s == "menu_air") then {menu_air = _obj_new;};
	
	if(_obj_s == "menu_build") then {tccc_1 = _obj_new;};
	
	if(_obj_s == "menu_hc") then {tccc = _obj_new;};
	
	if(_obj_s == "air_check") then {air_check = _obj_new;};
	
	if(_obj_s == "tp_f_1") then {fob_blue_1 = _obj_new;};
		
	if(_obj_s == "arsenal_0") then {arsenal_0 = _obj_new;};
	
	if(_obj_s == "arsenal_00") then {arsenal_00 = _obj_new;};
	
	if(_obj_s == "equipment_0") then {equipment_0 = _obj_new;};
	
	if(_obj_s == "equipment_00") then {equipment_00 = _obj_new;};
	
	if(_obj_s == "resupply_veh") then {};
	
	if(_obj_s == "resupply_0") then {[_obj_new] execVM "scripts\box_resupply.sqf";};
};
} forEach _b_list;

// Gets position of all specialty objects and deletes them
pos_cop_blue = [typeOf cop_blue,getPos cop_blue,getPosASL cop_blue,vectorDir cop_blue,vectorUp cop_blue];
deleteVehicle cop_blue;

pos_menu_ground = [typeOf menu_ground,getPos menu_ground,getPosASL menu_ground,vectorDir menu_ground,vectorUp menu_ground];
deleteVehicle menu_ground;

pos_ground_check = [typeOf ground_check,getPos ground_check,getPosASL ground_check,vectorDir ground_check,vectorUp ground_check];
deleteVehicle ground_check;

pos_arsenal_1 = [typeOf arsenal_1,getPos arsenal_1,getPosASL arsenal_1,vectorDir arsenal_1,vectorUp arsenal_1];
deleteVehicle arsenal_1;

pos_equipment_1 = [typeOf equipment_1,getPos equipment_1,getPosASL equipment_1,vectorDir equipment_1,vectorUp equipment_1];
deleteVehicle equipment_1;

pos_remoteBuilder = [typeOf remoteBuilder,getPos remoteBuilder,getPosASL remoteBuilder,vectorDir remoteBuilder,vectorUp remoteBuilder];
deleteVehicle remoteBuilder;

pos_cop_marker = getMarkerPos "cop_redoctober";


//Get all objects within 200m of the COP then save & delete them.
building_array = [];
_spCheck = nearestObjects[(getMarkerPos "cop_redoctober"),[],200]; 
aresmod addCuratorEditableObjects [_spCheck,false];
_sp2Check = curatorEditableObjects aresmod;
{
_tempArr = [typeOf _x,getPos _x,getPosASL _x,vectorDir _x,vectorUp _x];
building_array pushback _tempArr;
}forEach _sp2Check;

{deleteVehicle _x}forEach _sp2Check;

//Rebuild Remote Builder
remoteBuilder = createVehicle [pos_remoteBuilder select 0, pos_remoteBuilder select 1, [], 0, 'CAN_COLLIDE']; 
remoteBuilder setPosASL (pos_remoteBuilder select 2); 
remoteBuilder setVectorDirAndUp [pos_remoteBuilder select 3, pos_remoteBuilder select 4];

//Replace the markers.
deleteMarker "cop_redoctober";
deleteMarker "cop_redoctober_text";
_newMarker = createMarker ['cop_redoctober_no', pos_cop_marker];
_newMarker setMarkerShape 'ICON';
_newMarker setMarkerType 'flag_USA';
_newMarker setMarkerDir 0;
_newMarker setMarkerColor 'Default';
_newMarker setMarkerAlpha 1;
_newMarker = createMarker ['cop_redoctober_text_no', pos_cop_marker];
_newMarker setMarkerShape 'ICON';
_newMarker setMarkerType 'selector_selectable';
_newMarker setMarkerDir 0;
_newMarker setMarkerColor 'ColorRed';
_newMarker setMarkerAlpha 1;  
_newMarker setMarkerText "COP Red October (Not Built)";

};

menu_air addAction ["Air Vehicle Menu", "template\menu_air.sqf", "init"];
tccc addAction ["Open Testing Menu", "template\ryan_menu.sqf", "init"];
tccc_1 addAction ["Open Mission Menu", "template\tccc_menu.sqf", "init"];
fob_blue_1 addAction ["To COP Red October", "template\tpto_cop_blue.sqf"];
fob_blue_1 addAction ["To Lower Deck", "template\tpto_fob_blue.sqf"];
arsenal_0 addAction ["Clear Loadout", "scripts\clear_loadout.sqf", [],6,true,true,"","_this distance _target < 5"];
arsenal_00 addAction ["Clear Loadout", "scripts\clear_loadout.sqf", [],6,true,true,"","_this distance _target < 5"];
[arsenal_0] execVM "scripts\box_virtualarsenal.sqf";
[arsenal_00] execVM "scripts\box_virtualarsenal.sqf";
[equipment_0] execVM "scripts\box_equipment.sqf";
[equipment_00] execVM "scripts\box_equipment.sqf";
[remoteBuilder, ["Build COP Red October", "template\tccc_menu.sqf", "buildROremote"]] remoteExec ["addAction", 0, true];
remoteBuilder allowDamage false;
remoteBuilder setFuel 0;
publicVariable "remoteBuilder";
publicVariable "equipment_0";
publicVariable "equipment_00";
publicVariable "arsenal_0";
publicVariable "arsenal_00";
publicVariable "fob_blue";
publicVariable "fob_blue_1";
publicVariable "tccc_1";
publicVariable "tccc";
publicVariable "menu_air";
publicVariable "air_check";