#include "\meu_mod\script_macros.hpp"

// Prevent stomping on any other existing mission definitions
ISNILS(Ares_Reinforcement_Mission_Unit_Pools,[]);

Ares_Reinforcement_Mission_Unit_Pools pushBack [
    "RUSSIAN", // Name of the faction
    east, // The side of the faction
    "", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
    [
        "rhs_uaz_vdv",
        "rhs_uaz_open_vdv",
        "rhs_tigr_vdv",
        "rhs_tigr_3camo_vdv"
    ], // Scouts and unarmed light vehicles
    [
        "rhs_btr60_vdv",
        "rhs_btr70_vdv",
        "rhs_btr80_vdv",
        "rhs_btr80a_vdv"
    ], // Armed light vehicles
    [
        "RHS_Ural_VDV_01",
        "RHS_Ural_Open_VDV_01",
        "rhs_gaz66_vdv",
        "rhs_gaz66o_vdv"
    ], // Dedicated troop trucks
    [
        "rhs_bmd1",
        "rhs_bmd2",
        "rhs_bmd4_vdv",
        "rhs_bmp1_vdv",
        "rhs_bmp2_vdv"
    ], // Armed + Armored Troop Transports
    [
        "RHS_Mi8mt_Cargo_vdv",
        "RHS_Mi8AMT_vdv"
    ], // Unarmed helicopters
    [
        "RHS_Mi24P_AT_vdv",
        "RHS_Mi24P_CAS_vdv",
        "RHS_Mi8mt_vdv",
        "RHS_Mi8MTV3_vdv"
    ], // Armed helicopters
    [
        "O_Boat_Transport_01_F",
        "O_G_Boat_Transport_01_F"
    ], // Unarmed boats
    [
        "O_Boat_Armed_01_hmg_F"
    ], // Armed boats
    [
        // Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
        [
            "rhs_vdv_sergeant",
            "rhs_vdv_machinegunner",
            "rhs_vdv_RShG2",
            "rhs_vdv_rifleman",
            "rhs_vdv_machinegunner_assistant",
            "rhs_vdv_rifleman"
        ],
        [
            "rhs_vdv_sergeant",
            "rhs_vdv_RShG2",
            "rhs_vdv_grenadier",
            "rhs_vdv_medic",
            "rhs_vdv_engineer",
            "rhs_vdv_rifleman"
        ]
    ]
];

Ares_Reinforcement_Mission_Unit_Pools pushBack [
    "US ARMY", // Name of the faction
    west, // The side of the faction
    "", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
    [
        "rhsusf_m1025_w_s",
        "rhsusf_m998_w_s_2dr_halftop",
        "rhsusf_m998_w_s_2dr_fulltop",
        "rhsusf_m998_w_s_4dr_fulltop",
        "rhsusf_rg33_usmcd_wd"
    ], // Scouts and unarmed light vehicles
    [
        "rhsusf_rg33_m2_usmc_wd",
        "rhsusf_m1025_w_s_m2",
        "rhsusf_m1025_w_s_mk19"
    ], // Armed light vehicles
    [
        "rhsusf_M1083A1P2_B_d_fmtv_usarmy",
        "rhsusf_M1083A1P2_B_wd_fmtv_usarmy",
        "rhsusf_M1083A1P2_B_d_open_fmtv_usarmy",
        "rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy",
        "rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy",
        "rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy"
    ], // Dedicated troop trucks
    [
        "CHA_LAV25"
    ], // Armed + Armored Troop Transports
    [
        "RHS_ch53e_usmc",
        "rhs_uh1y_unarmed"
    ], // Unarmed helicopters
    [
        "RHS_uh1y",
        "RHS_uh1y_gs",
        "rhs_uh1y_ffar"
    ], // Armed helicopters
    [
        "B_Boat_Transport_01_F"
    ], // Unarmed boats
    [
        "rhsusf_mkvsoc",
        "b_t_boat_armed_01_minigun_F"
    ], // Armed boats
    [
        // Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
        [
            "rhsusf_usmc_marpat_wd_squadleader",
            "rhsusf_usmc_marpat_wd_teamleader",
            "rhsusf_usmc_marpat_wd_autorifleman_m249",
            "rhsusf_usmc_marpat_wd_riflemanat",
            "rhsusf_navy_marpat_wd_medic",
            "rhsusf_usmc_marpat_wd_rifleman_m4"
        ],
        [
            "rhsusf_usmc_marpat_wd_teamleader",
            "rhsusf_usmc_marpat_wd_autorifleman_m249",
            "rhsusf_usmc_marpat_wd_rifleman_m4",
            "rhsusf_usmc_marpat_wd_grenadier",
            "rhsusf_usmc_marpat_wd_rifleman_m4",
            "rhsusf_usmc_marpat_wd_riflemanat"
        ]
    ]
];

Ares_Reinforcement_Mission_Unit_Pools pushBack [
    "People's Liberation Army", // Name of the faction
    resistance, // The side of the faction
    "", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
    [
        "rhs_uaz_vdv",
        "rhs_uaz_open_vdv",
        "rhs_tigr_vdv",
        "rhs_tigr_3camo_vdv"
    ], // Scouts and unarmed light vehicles
    [
        "rhs_btr60_vdv",
        "rhs_btr70_vdv",
        "rhs_btr80_vdv",
        "rhs_btr80a_vdv"
    ], // Armed light vehicles
    [
        "RHS_Ural_VDV_01",
        "RHS_Ural_Open_VDV_01",
        "rhs_gaz66_vdv",
        "rhs_gaz66o_vdv"
    ], // Dedicated troop trucks
    [
        "rhs_bmd1",
        "rhs_bmd2",
        "rhs_bmd4_vdv",
        "rhs_bmp1_vdv",
        "rhs_bmp2_vdv"
    ], // Armed + Armored Troop Transports
    [
        "RHS_Mi8mt_Cargo_vdv",
        "RHS_Mi8AMT_vdv",
        "rhs_ka60_c"
    ], // Unarmed helicopters
    [
        "RHS_Mi24P_AT_vdv",
        "RHS_Mi24P_CAS_vdv",
        "RHS_Mi8mt_vdv",
        "RHS_Mi8MTV3_vdv"
    ], // Armed helicopters
    [
        "I_Boat_Transport_01_F",
        "I_C_Boat_Transport_02_F"
    ], // Unarmed boats
    [
        "I_Boat_Armed_01_minigun_F"
    ], // Armed boats
    [
        // Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
        [
            "PLA_Soldier_SL_F",
            "PLA_Soldier_TL_F",
            "PLA_Soldier_AT89B_F",
            "PLA_Soldier_F",
            "PLA_Soldier_GL_F",
            "PLA_Soldier_medic_F"
        ],
        [
            "PLA_Soldier_TL_F",
            "PLA_Soldier_HMG_F",
            "PLA_Soldier_F",
            "PLA_Soldier_GL_F",
            "PLA_Soldier_medic_F",
            "PLA_Soldier_AT89B_F"
        ]
    ]
];
