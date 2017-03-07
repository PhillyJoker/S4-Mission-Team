#include "\mrb_mod\script_component.hpp"

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
