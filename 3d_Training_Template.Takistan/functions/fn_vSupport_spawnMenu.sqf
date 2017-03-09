#include "\mrb_mod\script_component.hpp"

[
    "SUPPORT VEHICLE SPAWN MENU",
    [
        ["Delete Vehicle", "delete_any"],
        ["Quad Bike", "B_Quadbike_01_F"],
        ["HMMWV Desert (2d Unarmed, Covered)", "rhsusf_m998_d_2dr_fulltop"],
        ["HMMWV Desert (4d Unarmed, Uncovered)", "rhsusf_m998_d_4dr"],
        ["HMMWV Woodland (2d Unarmed, Covered)", "rhsusf_m998_w_2dr_fulltop"],
        ["HMMWV Woodland (4d Unarmed, Uncovered)", "rhsusf_m998_w_4dr"],
        ["HEMTT (Ammo)", "B_Truck_01_ammo_F"],
        ["HEMTT (Cargo)", "B_Truck_01_box_F"],
        ["HEMTT (Fuel)", "B_Truck_01_fuel_F"],
        ["HEMTT (Medical)", "B_Truck_01_medical_F"],
        ["HEMTT (Repair)", "B_Truck_01_repair_F"],
        ["HEMTT (Transport Uncovered)", "B_Truck_01_transport_F"],
        ["HEMTT (Transport Covered)", "B_Truck_01_covered_F"]
    ],
    FNC(vehicleSpawn), _this select 0, "SPAWN"
] call FNC(listDialog);
