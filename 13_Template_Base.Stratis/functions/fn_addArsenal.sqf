// null = [this] execVM "scripts\box_virtualarsenal.sqf";

if (!hasInterface) exitWith {
    diag_log format [
        "[13th MEU] ERROR: Non-client call to file %1 in mission %2 - file is marked CLIENT_ONLY!",
        __FILE__, missionName
    ]
};

[{!isNil "MEU_templateSeason"}, {
    params ["_crate"];
    _season = MEU_templateSeason;
    _seasonBackpacks = [];
    _seasonItemCargo = [];
    
    ["AmmoboxInit", [_crate, false, {true}]] spawn BIS_fnc_arsenal;
    
    if (_season == "summer") then {
        _seasonBackpacks = [
            "tfw_ilbe_d",
            "tfw_ilbe_dd_d",
            "tfw_ilbe_blade_d",
            "13th_Carryall_MEF_DM",
            "13th_Kitbag_MEF_DM",
            "13th_Assault_MEF_DM",
            "13th_Tactical_MEF_DM"
        ];
        _seasonItemCargo = [
            "rhsusf_lwh_helmet_marpatd",
            "rhsusf_lwh_helmet_marpatd_ess",
            "rhsusf_lwh_helmet_marpatd_headset",
            "rhsusf_mich_helmet_marpatd",
            "rhsusf_mich_helmet_marpatd_headset",
            "rhsusf_mich_helmet_marpatd_alt",
            "rhsusf_mich_helmet_marpatd_alt_headset",
            "rhsusf_mich_helmet_marpatd_norotos",
            "rhsusf_mich_helmet_marpatd_norotos_headset",
            "rhsusf_cvc_ess",
            "rhsusf_cvc_helmet",
            "rhs_uniform_FROG01_d"
        ];
    };
    
    if (_season == "winter") then {
        _seasonBackpacks = [
            "tfw_ilbe_wd",
            "tfw_ilbe_dd_wd",
            "tfw_ilbe_blade_wd",
            "13th_Carryall_MEF_WM",
            "13th_Kitbag_MEF_WM",
            "13th_Assault_MEF_WM",
            "13th_Tactical_MEF_WM",
            "13th_Carryall_MEF_M81",
            "13th_Kitbag_MEF_M81",
            "13th_Assault_MEF_M81"
        ];
        _seasonItemCargo = [
            "rhsusf_lwh_helmet_marpatwd",
            "rhsusf_lwh_helmet_marpatwd_ess",
            "rhsusf_lwh_helmet_marpatwd_headset",
            "rhsusf_lwh_helmet_marpatwd_headset_blk",
            "rhsusf_lwh_helmet_marpatwd_blk_ess",
            "rhsusf_mich_helmet_marpatwd",
            "rhsusf_mich_helmet_marpatwd_headset",
            "rhsusf_mich_helmet_marpatwd_alt",
            "rhsusf_mich_helmet_marpatwd_alt_headset",
            "rhsusf_mich_helmet_marpatwd_norotos",
            "rhsusf_mich_helmet_marpatwd_norotos_headset",
            "rhsusf_cvc_green_helmet",
            "rhsusf_cvc_green_ess",
            "rhs_uniform_FROG01_wd"
        ];
    };
    
    if (_season == "both") then {
        _seasonBackpacks = [
            // "summer"
            "tfw_ilbe_d",
            "tfw_ilbe_dd_d",
            "tfw_ilbe_blade_d",
            "13th_Carryall_MEF_DM",
            "13th_Kitbag_MEF_DM",
            "13th_Assault_MEF_DM",
            "13th_Tactical_MEF_DM",
            // "winter"
            "tfw_ilbe_wd",
            "tfw_ilbe_dd_wd",
            "tfw_ilbe_blade_wd",
            "13th_Carryall_MEF_WM",
            "13th_Kitbag_MEF_WM",
            "13th_Assault_MEF_WM",
            "13th_Tactical_MEF_WM",
            "13th_Carryall_MEF_M81",
            "13th_Kitbag_MEF_M81",
            "13th_Assault_MEF_M81"
        ];
        _seasonItemCargo = [
            // "summer"
            "rhsusf_lwh_helmet_marpatd",
            "rhsusf_lwh_helmet_marpatd_ess",
            "rhsusf_lwh_helmet_marpatd_headset",
            "rhsusf_mich_helmet_marpatd",
            "rhsusf_mich_helmet_marpatd_headset",
            "rhsusf_mich_helmet_marpatd_alt",
            "rhsusf_mich_helmet_marpatd_alt_headset",
            "rhsusf_mich_helmet_marpatd_norotos",
            "rhsusf_mich_helmet_marpatd_norotos_headset",
            "rhsusf_cvc_ess",
            "rhsusf_cvc_helmet",
            "rhs_uniform_FROG01_d",
            // "winter"
            "rhsusf_lwh_helmet_marpatwd",
            "rhsusf_lwh_helmet_marpatwd_ess",
            "rhsusf_lwh_helmet_marpatwd_headset",
            "rhsusf_lwh_helmet_marpatwd_headset_blk",
            "rhsusf_lwh_helmet_marpatwd_blk_ess",
            "rhsusf_mich_helmet_marpatwd",
            "rhsusf_mich_helmet_marpatwd_headset",
            "rhsusf_mich_helmet_marpatwd_alt",
            "rhsusf_mich_helmet_marpatwd_alt_headset",
            "rhsusf_mich_helmet_marpatwd_norotos",
            "rhsusf_mich_helmet_marpatwd_norotos_headset",
            "rhsusf_cvc_green_helmet",
            "rhsusf_cvc_green_ess",
            "rhs_uniform_FROG01_wd"
        ];
    };
    
    // Backpacks, Backpack Radio, Parachute, Mortar's
    _availableBackpacks = [
        // Vanilla
        "B_Mortar_01_support_F",
        "B_Mortar_01_weapon_F",
        "B_Carryall_cbr",
        "B_Carryall_khk",
        "B_Kitbag_cbr",
        "B_Parachute",
        // RHS + Modified
        "506th_assault_eagleaiii_coy_Medic",
        "rhsusf_assault_eagleaiii_coy",
        "rhs_M252_Bipod_Bag",
        "rhs_M252_Gun_Bag",
        "rhs_M225_Gun_Bag",
        "rhs_M170_Bipod_Bag",
        // ILBE Radio's
        "tfw_ilbe_dd_coy",
        "tfw_ilbe_coy",
        // Custom 13th
        "13th_Carryall_MEF_BL",
        "13th_Kitbag_MEF_BL",
        "13th_Assault_MEF_BL",
        "13th_Carryall_MEF_CY",
        "13th_Kitbag_MEF_CY",
        "13th_Kitbag_MEF_CY",
        "13th_Assault_MEF_CY",
        "13th_Assault_ST_CY",
        "13th_Assault_NWI_CY",
        "13th_Assault_WI_CY",
        "13th_Carryall_ST_CY",
        "13th_Carryall_CM_CY",
        "13th_Largeruck_ST_CY",
        "13th_Carryall_MEF_OD",
        "13th_Kitbag_MEF_OD",
        "13th_Assault_MEF_OD",
        "13th_Assault_CM_SA",
        "13th_Assault_NWI_SA",
        "13th_Assault_WI_SA",
        "13th_Carryall_ST_SA",
        "13th_Carryall_CM_SA",
        "13th_Largeruck_ST_SA",
        "13th_Carryall_MEF_TN",
        "13th_Assault_MEF_TN",
        "13th_Tactical_MEF_TN"
    ];
    
    // Helmets, Goggles, Uniform's, Vests, Items, Accessories
    _availableItemCargo = [
        // Helmets
        "rhsusf_hgu56p",
        "rhsusf_hgu56p_mask",
        "RHS_jetpilot_usaf",
        // Goggles
        "G_Shades_Black",
        "G_Shades_Blue",
        "G_Shades_Green",
        "G_Shades_Red",
        "G_Spectacles_Tinted",
        "G_Lowprofile",
        "rhs_googles_clear",
        "rhs_googles_orange",
        "rhs_googles_yellow",
        "rhs_googles_black",
        "rhs_ess_black",
        // Uniforms
        "U_B_HeliPilotCoveralls",
        // Vests
        "rhsusf_spc",
        "rhsusf_spc_light",
        "rhsusf_spc_corpsman",
        "rhsusf_spc_crewman",
        "rhsusf_spc_rifleman",
        "rhsusf_spc_iar",
        "rhsusf_spc_marksman",
        "rhsusf_spc_mg",
        "rhsusf_spc_squadleader",
        "rhsusf_spc_teamleader",
        "rhsusf_spc_patchless",
        "rhsusf_spc_patchless_radio",
        "V_TacVest_oli",
        // Ace Items
        // Basic Medical
        "ACE_bloodIV_250",
        "ACE_epinephrine",
        "ACE_fieldDressing",
        "ACE_morphine",
        // Advanced Medical
        "ACE_atropine",
        "ACE_elasticBandage",
        "ACE_quikclot",
        "ACE_bloodIV",
        "ACE_bloodIV_500",
        "ACE_packingBandage",
        "ACE_personalAidKit",
        "ACE_plasmaIV",
        "ACE_plasmaIV_500",
        "ACE_plasmaIV_250",
        "ACE_salineIV",
        "ACE_salineIV_500",
        "ACE_salineIV_250",
        "ACE_tourniquet",
        "ACE_surgicalKit",
        // Ace Items
        "ACE_SpraypaintBlack",
        "ACE_SpraypaintBlue",
        "ACE_SpraypaintGreen",
        "ACE_SpraypaintRed",
        "ACE_TacticalLadder_Item",
        "ACE_Tripod",
        "ACE_UAVBattery",
        "ACE_wirecutter",
        "ACE_Flashlight_MX991",
        "ACE_HuntIR_monitor",
        "ACE_Kestrel4500",
        "ACE_M26_Clacker",
        "ACE_MapTools",
        "ACE_Altimeter",
        "ACE_CableTie",
        "ACE_Clacker",
        "ACE_DefusalKit",
        "ACE_EarPlugs",
        "ACE_EntrenchingTool",
        "ACE_RangeTable_82mm",
        // NVG's
        "rhsusf_Rhino",
        "rhsusf_ANPVS_14",
        "rhsusf_ANPVS_15",
        "rhsusf_ANPVS_15_ng",
        "rhsusf_ANPVS_14_full",
        "rhsusf_ANPVS_15_full",
        "rhsusf_ANPVS_14_oval",
        "rhsusf_ANPVS_14_full_ng",
        "rhsusf_ANPVS_15_full_ng",
        "rhsusf_ANPVS_14_oval_ng",
        // CTAB
        "ItemAndroid",
        "ItemMicroDAGR",
        "ItemcTab",
        "ItemcTabHCam",
        // Vanilla Items
        "ItemWatch",
        "ItemGPS",
        "ItemMap",
        "ItemCompass",
        "B_UavTerminal",
        "MineDetector",
        "TIAD_506th_UAV_Item",
        "ToolKit",
        // Weapon Accessories
        "acc_pointer_IR",
        "rhsusf_acc_anpeq15",
        "rhsusf_acc_anpeq15A",
        "rhsusf_acc_anpeq15_light",
        "rhsusf_acc_anpeq15side",
        "rhsusf_acc_anpeq15_top",
        "rhsusf_acc_anpeq15side_bk",
        "rhsusf_acc_anpeq15_bk_top",
        "rhsusf_acc_anpeq15_bk",
        "rhsusf_acc_anpeq15_bk_light",
        "rhsusf_acc_ACOG_USMC",
        "rhsusf_acc_ACOG2_USMC",
        "rhsusf_acc_ACOG3_USMC",
        "rhsusf_acc_compm4",
        "rhsusf_acc_ELCAN",
        "FHQ_optic_ACOG",
        "FHQ_optic_AimM_BLK",
        "FHQ_optic_AC11704",
        "FHQ_optic_TWS3050",
        "optic_tws",
        "optic_tws_mg",
        "rhsusf_acc_premier_anpvs27",
        "rhsusf_acc_premier",
        "rhsusf_acc_harris_bipod",
        "rhsusf_acc_grip1",
        "rhsusf_acc_grip2",
        "rhsusf_acc_grip3",
        "rhsusf_acc_SF3P556",
        "rhs_weap_optic_smaw",
        "tfw_rf3080Item"
    ];
    
    // Magazines, Ammo, Grenades
    _availableMagazines = [
        "30Rnd_556x45_Stanag",
        "30Rnd_556x45_Stanag_Tracer_Red",
        "rhs_mag_30Rnd_556x45_Mk318_Stanag",
        "ACE_HuntIR_M203",
        "rhs_mag_M433_HEDP",
        "rhs_mag_M441_HE",
        "rhs_mag_m4009",
        "rhs_mag_m576",
        "rhs_mag_M585_white",
        "rhs_mag_m661_green",
        "rhs_mag_m662_red",
        "rhs_mag_m713_Red",
        "rhs_mag_m714_White",
        "rhs_mag_m715_Green",
        "rhs_mag_m716_yellow",
        "rhsusf_100Rnd_762x51",
        "rhsusf_100Rnd_762x51_m993",
        "rhsusf_100Rnd_556x45_soft_pouch",
        "rhsusf_200Rnd_556x45_soft_pouch",
        "rhs_200rnd_556x45_M_SAW",
        "rhsusf_5Rnd_00Buck",
        "rhsusf_5Rnd_Slug",
        "rhsusf_8Rnd_00Buck",
        "rhsusf_8Rnd_Slug",
        "rhsusf_20Rnd_762x51_m118_special_Mag",
        "rhs_m136_mag",
        "rhs_m136_hp_mag",
        "rhs_m136_hedp_mag",
        "rhs_mag_smaw_HEAA",
        "rhs_mag_smaw_HEDP",
        "rhs_mag_smaw_SR",
        "rhs_m72a7_mag",
        "rhsusf_mag_6Rnd_M585_white",
        "rhsusf_mag_6Rnd_m661_green",
        "rhsusf_mag_6Rnd_m662_red",
        "rhsusf_mag_6Rnd_M713_red",
        "rhsusf_mag_6Rnd_M714_white",
        "rhsusf_mag_6Rnd_M715_green",
        "rhsusf_mag_6Rnd_M716_yellow",
        "rhsusf_mag_15Rnd_9x19_FMJ",
        "rhsusf_mag_15Rnd_9x19_JHP",
        "ACE_1Rnd_82mm_Mo_HE",
        "ACE_1Rnd_82mm_Mo_Smoke",
        "ACE_1Rnd_82mm_Mo_Illum",
        "DemoCharge_Remote_Mag",
        "SatchelCharge_Remote_Mag",
        "ClaymoreDirectionalMine_Remote_Mag",
        "ATMine_Range_Mag",
        "SLAMDirectionalMine_Wire_Mag",
        "APERSBoundingMine_Range_Mag",
        "ACE_HandFlare_Green",
        "ACE_HandFlare_Red",
        "ACE_HandFlare_White",
        "ACE_HandFlare_Yellow",
        "rhs_mag_mk84",
        "HandGrenade",
        "B_IR_Grenade",
        "SmokeShell",
        "SmokeShellRed",
        "SmokeShellGreen",
        "SmokeShellYellow",
        "SmokeShellPurple",
        "SmokeShellBlue",
        "SmokeShellOrange",
        "Chemlight_green",
        "Chemlight_red",
        "Chemlight_blue",
        "Chemlight_yellow"
    ];
    
    // Weapons
    _availableWeapons = [
        "rhs_weap_m4",
        "rhs_weap_m4_pmag",
        "rhs_weap_m4_mstock",
        "rhs_weap_m4_m203",
        "rhs_weap_m4_m203S",
        "rhs_weap_m4_carryhandle",
        "rhs_weap_m4_carryhandle_pmag",
        "rhs_weap_m4_carryhandle_mstock",
        "rhs_weap_m16a4",
        "rhs_weap_m16a4_carryhandle",
        "rhs_weap_m16a4_carryhandle_pmag",
        "rhs_weap_m16a4_carryhandle_M203",
        "rhs_weap_m249_pip_S",
        "rhs_weap_m249_pip_S_para",
        "rhs_weap_m249_pip_S_vfg",
        "rhs_weap_m249_pip_L",
        "rhs_weap_m249_pip_L_para",
        "rhs_weap_m249_pip_L_vfg",
        "rhs_weap_m27iar",
        "rhs_weap_m240B",
        "rhs_weap_M590_8RD",
        "rhs_weap_M590_5RD",
        "rhs_weap_sr25",
        "rhs_weap_M136",
        "rhs_weap_M136_hedp",
        "rhs_weap_M136_hp",
        "rhs_weap_m72a7",
        "rhs_weap_smaw_green",
        "rhs_weap_m32_usmc",
        "rhsusf_weap_m9",
        "Binocular"
    ];
    
    // Populate with predefined items
    [_crate, _availableBackpacks + _seasonBackpacks] call BIS_fnc_addVirtualBackpackCargo;
    [_crate, _availableItemCargo + _seasonItemCargo] call BIS_fnc_addVirtualItemCargo;
    [_crate, _availableMagazines] call BIS_fnc_addVirtualMagazineCargo;
    [_crate, _availableWeapons] call BIS_fnc_addVirtualWeaponCargo;
}, _this] call CBA_fnc_waitUntilAndExecute;
