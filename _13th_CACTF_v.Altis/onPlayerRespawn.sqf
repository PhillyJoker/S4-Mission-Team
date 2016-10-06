
// For if its needed at some point in the future.
//_holster = player addAction ["Holster weapons", {_unit=_this select 1; _unit action ['SwitchWeapon', _unit, _unit, 100];}, [], 1.5, false]; 

/*
_DamageEH = player addEventhandler["HandleDamage",{false}];

 RCT Instructors
	"B_medic_F"
 ITB Instructors
	"B_recon_medic_F"
 MCT Intructor
	"B_CTRG_soldier_M_medic_F"
 FMTB Instructors
	"rhsusf_navy_sarc_w"
 Weapons Instructors
	"rhsusf_navy_marpat_d_medic"
 CPLC/SGTC Instructors
	"rhsusf_navy_sarc_d"
*/



if (player iskindof "B_medic_F") then {
	// RCT Instructors
		player allowdamage false;
	};
 
	if (player iskindof "B_recon_medic_F") then {
	// ITB Instructors
		player allowdamage false;
	};
	
	if (player iskindof "B_CTRG_soldier_M_medic_F") then {
	// MCT Intructors
		player allowdamage false;
	};
	
	if (player iskindof "rhsusf_navy_marpat_d_medic") then {
	// Weapons Intructors
		player allowdamage false;
	};

	if (player iskindof "rhsusf_navy_sarc_w") then {
	// FMTB Instructors
		player allowdamage false;	
	};