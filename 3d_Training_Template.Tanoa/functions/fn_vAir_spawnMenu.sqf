#include "\mrb_mod\script_component.hpp"

[
    "AIR VEHICLE SPAWN MENU",
    [
        ["Delete Vehicle", "delete_any"],
        ["Quad Bike", "B_Quadbike_01_F"],
        ["A-10A (CAS)", "RHS_A10"],
        ["A-10A (AT)", "RHS_A10_AT"],
        ["AC-130U Spooky II", "USAF_AC130U"],
        ["C-130J", "RHS_C130J"],
        ["F/A-18 E Super Hornet", "JS_JC_FA18E"],
        ["F/A-18 F Super Hornet", "JS_JC_FA18F"],
        ["AH-1Z (Multi-Role)", "RHS_AH1Z"],
        ["AH-1Z (Close Support)", "RHS_AH1Z_CS"],
        ["AH-1Z (Ground Suppression)", "RHS_AH1Z_GS"],
        ["AH-6 Little Bird", "B_Heli_Light_01_armed_F"],
        ["MH-6 Little Bird", "B_Heli_Light_01_F"],
        ["AH-6M-H Little Bird", "RHS_MELB_AH6M_H"],
        ["AH-6M-L Little Bird", "RHS_MELB_AH6M_L"],
        ["AH-6M-M Little Bird", "RHS_MELB_AH6M_M"],
        ["MH-6M Little Bird", "RHS_MELB_MH6M"],
        ["OH-6M Little Bird", "RHS_MELB_H6M"],
        ["CH-47F Woodland", "RHS_CH_47F"],
        ["CH-47F Desert", "RHS_CH_47F_light"],
        ["CH-53E", "rhsusf_CH53E_USMC"],
        ["CV-22B Osprey", "USAF_CV22"],
        ["UH-1Y (Unarmed)", "RHS_UH1Y_UNARMED"],
        ["UH-1Y (FFAR)", "RHS_UH1Y_FFAR"],
        ["UH-1Y (FFAR/MG)", "RHS_UH1Y"],
        ["UH-1Y (Ground Suppression)", "RHS_UH1Y_GS"],
        ["UH-60M", "RHS_UH60M"],
        ["UH-60M MEV", "RHS_UH60M_MEV2"],
        ["UH-60M MEV (ESSS)", "RHS_UH60M_MEV"]
    ],
    FNC(vehicleSpawn), _this select 0, "SPAWN"
] call FNC(listDialog);
