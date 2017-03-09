#include "\mrb_mod\script_component.hpp"

[
    "GROUND VEHICLE SPAWN MENU",
    [
        ["Delete Vehicle", "delete_any"],
        ["Quad Bike", "B_Quadbike_01_F"],
        ["Prowler Desert (Armed)", "B_LSV_01_armed_F"],
        ["Prowler Desert (Unarmed)", "B_LSV_01_unarmed_F"],
        ["Prowler Light (Unarmed)", "B_CTRG_01_light_F"],
        ["Prowler Woodland (Armed)", "B_T_LSV_01_armed_F"],
        ["Prowler Woodland (Unarmed)", "B_T_LSV_01_unarmed_F"],
        ["HMMWV Desert (M2)", "rhsusf_m1025_d_m2"],
        ["HMMWV Desert (Mk19)", "rhsusf_m1025_d_Mk19"],
        ["HMMWV Desert (Unarmed)", "rhsusf_m1025_d"],
        ["HMMWV Woodland (M2)", "rhsusf_m1025_w_m2"],
        ["HMMWV Woodland (Mk19)", "rhsusf_m1025_w_Mk19"],
        ["HMMWV Woodland (Unarmed)", "rhsusf_m1025_w"],
        ["RG-33 Desert (Unarmed)", "rhsusf_rg33_usmc_d"],
        ["RG-33 Desert (M2)", "rhsusf_rg33_m2_usmc_d"],
        ["RG-33 Woodland (Unarmed)", "rhsusf_rg33_usmc_wd"],
        ["RG-33 Woodland (M2)", "rhsusf_rg33_m2_usmc_wd"],
        ["M1232 Desert (Unarmed)", "rhsusf_m1232_usarmy_d"],
        ["M1232 Desert (M2)", "rhsusf_m1232_M2_usarmy_d"],
        ["M1232 Desert (MK19)", "rhsusf_m1232_MK19_usarmy_d"],
        ["M1237 Desert (M2)", "rhsusf_m1237_M2_usarmy_d"],
        ["M1237 Desert (MK19)", "rhsusf_m1237_MK19_usarmy_d"],
        ["M1232 Woodland (Unarmed)", "rhsusf_m1232_usarmy_wd"],
        ["M1232 Woodland (M2)", "rhsusf_m1232_M2_usarmy_wd"],
        ["M1232 Woodland (MK19)", "rhsusf_m1232_MK19_usarmy_wd"],
        ["M1237 Woodland (M2)", "rhsusf_m1237_M2_usarmy_wd"],
        ["M1237 Woodland (MK19)", "rhsusf_m1237_MK19_usarmy_wd"]
    ],
    FNC(vehicleSpawn), _this select 0, "SPAWN"
] call FNC(listDialog);
