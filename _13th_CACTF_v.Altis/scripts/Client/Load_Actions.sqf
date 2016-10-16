// 13th MEU ITB SlideShow Script
// Edited by: McKelvie
// Help: called from INIT.SQF using execVM "13thMEU_slides.sqf";

Sleep 15;

//ITB Training
act1 = Desk_1 addaction ["ITB Introduction","Scripts\Pics\ITB\intro_slide.sqf"];
act1 = Desk_1 addaction ["Platoon Structure - Hierarchy","Scripts\Pics\ITB\platoon_structure.sqf"];
act1 = Desk_1 addaction ["Weapon - M4 Carbine","Scripts\Pics\ITB\m4.sqf"];
act1 = Desk_1 addaction ["Weapon - M16A4","Scripts\Pics\ITB\m16.sqf"];
act1 = Desk_1 addaction ["Weapon - M16A4 M203","Scripts\Pics\ITB\m203.sqf"];
act1 = Desk_1 addaction ["Weapon - M249 SAW","Scripts\Pics\ITB\saw.sqf"];
act1 = Desk_1 addaction ["Weapon - M27","Scripts\Pics\ITB\m27.sqf"];
act1 = Desk_1 addaction ["Weapon - M240B","Scripts\Pics\ITB\m240.sqf"];
act1 = Desk_1 addaction ["Weapon - M136 AT4","Scripts\Pics\ITB\at4.sqf"];
act1 = Desk_1 addaction ["Weapon - M67 Frag","Scripts\Pics\ITB\m67.sqf"];
act1 = Desk_1 addaction ["Weapon - Flashbang","Scripts\Pics\ITB\flashbang.sqf"];
act1 = Desk_1 addaction ["Weapon - Smoke","Scripts\Pics\ITB\Smoke.sqf"];
act1 = Desk_1 addaction ["Weapon - Beretta M9","Scripts\Pics\ITB\m9.sqf"];
act1 = Desk_1 addaction ["Optic - RCO","Scripts\Pics\ITB\RCO.sqf"];
act1 = Desk_1 addaction ["Optic - M68 CCO","Scripts\Pics\ITB\cco.sqf"];
act1 = Desk_1 addaction ["Optic - Eotech","Scripts\Pics\ITB\eotech.sqf"];
act1 = Desk_1 addaction ["Optic - M145 MGO","Scripts\Pics\ITB\mgo.sqf"];

//Spacer
Desk_1 addaction ["------------------------------------",""];

//Land Navigation Images
act1 = Desk_1 addaction ["LandNav - Hill","Scripts\Pics\ITB\LandNav\Hill.sqf"];
act1 = Desk_1 addaction ["LandNav - Ridge","Scripts\Pics\ITB\LandNav\Ridge.sqf"];
act1 = Desk_1 addaction ["LandNav - Valley","Scripts\Pics\ITB\LandNav\Valley.sqf"];
act1 = Desk_1 addaction ["LandNav - Saddle","Scripts\Pics\ITB\LandNav\Saddle.sqf"];
act1 = Desk_1 addaction ["LandNav - Depression","Scripts\Pics\ITB\LandNav\Depression.sqf"];
act1 = Desk_1 addaction ["LandNav - Draw","Scripts\Pics\ITB\LandNav\Draw.sqf"];
act1 = Desk_1 addaction ["LandNav - Cliff","Scripts\Pics\ITB\LandNav\Cliff.sqf"];

//Spacer
//Desk_1 addaction ["------------------------------------",""];

//Recruit Training Images - Removed until new slides made.
//act1 = Desk_1 addaction ["Ranks - Enlisted","Scripts\Pics\RCT\Ranks_Enlisted.sqf"];
//act1 = Desk_1 addaction ["Ranks - Warrant Officer","Scripts\Pics\RCT\Ranks_Warrant.sqf"];
//act1 = Desk_1 addaction ["Ranks - Officer","Scripts\Pics\RCT\Ranks_Officer.sqf"];

//Spacer
Desk_1 addaction ["------------------------------------",""];

//CMS Images
act1 = Desk_1 addaction ["BAS CoC","Scripts\Pics\CMS\CMS_Structure.sqf"];

//Sleep 10;

//Rotary Wing Images
act2 = Desk_2 addaction ["Day One","Scripts\Pics\Rotary\Day_one.sqf"];
act2 = Desk_2 addaction ["Day Two","Scripts\Pics\Rotary\Day_two.sqf"];
act2 = Desk_2 addaction ["Form DIAMOND, ECHELON L/R","Scripts\Pics\Rotary\Formations_one.sqf"];
act2 = Desk_2 addaction ["Form Heavy L/R, VEE","Scripts\Pics\Rotary\Formations_two.sqf"];
act2 = Desk_2 addaction ["Form TRAIL, STAGGERED R/L","Scripts\Pics\Rotary\Formations_three.sqf"];

//Fixed Wing Images
act2 = Desk_2 addaction ["Check-in","Scripts\Pics\Fixed\Checkin.sqf"];
act2 = Desk_2 addaction ["Line 1","Scripts\Pics\Fixed\Line_1.sqf"];
act2 = Desk_2 addaction ["Line 2","Scripts\Pics\Fixed\Line_2.sqf"];
act2 = Desk_2 addaction ["Line 3","Scripts\Pics\Fixed\Line_3.sqf"];
act2 = Desk_2 addaction ["Line 4","Scripts\Pics\Fixed\Line_4.sqf"];
act2 = Desk_2 addaction ["Line 5","Scripts\Pics\Fixed\Line_5.sqf"];
act2 = Desk_2 addaction ["Line 6","Scripts\Pics\Fixed\Line_6.sqf"];
act2 = Desk_2 addaction ["Line 7","Scripts\Pics\Fixed\Line_7.sqf"];
act2 = Desk_2 addaction ["Line 8","Scripts\Pics\Fixed\Line_8.sqf"];
act2 = Desk_2 addaction ["Line 9","Scripts\Pics\Fixed\Line_9.sqf"];
act2 = Desk_2 addaction ["Remarks","Scripts\Pics\Fixed\Remarks.sqf"];
act2 = Desk_2 addaction ["Radio Freqs","Scripts\Pics\Fixed\Radio_Freqs.sqf"];
act2 = Desk_2 addaction ["Take off","Scripts\Pics\Fixed\TakeOff.sqf"];
act2 = Desk_2 addaction ["Landing","Scripts\Pics\Fixed\Landing.sqf"];

// Medical Area 1
MedicalData1 addAction["Create Patient Light Wounds","scripts\Courses\CMS\createpatient1Light.sqf"];
MedicalData1 addAction["Create Patient Medium Wounds","scripts\Courses\CMS\createpatient1Medium.sqf"];
MedicalData1 addAction["Create Patient Heavy Wounds","scripts\Courses\CMS\createpatient1Heavy.sqf"];
MedicalData1 addAction["Create Patient Random Wounds","scripts\Courses\CMS\createpatient1Random.sqf"];
MedicalData1 addAction["Delete Patient","{if ((typeOf _x == 'b_g_survivor_F') && (!isPlayer _x)) then {deleteVehicle _x}} forEach allUnits;"];

// Medical Area 2
MedicalData2 addAction["Create Patient Light Wounds","scripts\Courses\CMS\createpatient2Light.sqf"];
MedicalData2 addAction["Create Patient Medium Wounds","scripts\Courses\CMS\createpatient2Medium.sqf"];
MedicalData2 addAction["Create Patient Heavy Wounds","scripts\Courses\CMS\createpatient2Heavy.sqf"];
MedicalData2 addAction["Create Patient Random Wounds","scripts\Courses\CMS\createpatient2Random.sqf"];
MedicalData2 addAction["Delete Patient","{if ((typeOf _x == 'b_survivor_F') && (!isPlayer _x)) then {deleteVehicle _x}} forEach allUnits;"];

// Medical Area 3
MedicalData3 addAction["Create Patient Light Wounds","scripts\Courses\CMS\createpatient3Light.sqf"];
MedicalData3 addAction["Create Patient Medium Wounds","scripts\Courses\CMS\createpatient3Medium.sqf"];
MedicalData3 addAction["Create Patient Heavy Wounds","scripts\Courses\CMS\createpatient3Heavy.sqf"];
MedicalData3 addAction["Create Patient Random Wounds","scripts\Courses\CMS\createpatient3Random.sqf"];
MedicalData3 addAction["Delete Patient","{if ((typeOf _x == 'b_soldier_unarmed_f') && (!isPlayer _x)) then {deleteVehicle _x}} forEach allUnits;"];

// MOUT Area
rc1_1 addAction ["Prepare Targets","[[0],'meu_Func_SW_targets',false,false] spawn BIS_fnc_MP;",1];
rc1_2 addAction ["Prepare Targets","[[0],'meu_Func_SE_targets',false,false] spawn BIS_fnc_MP;",1];
rc1_3 addAction ["Prepare Targets","[[0],'meu_Func_NE_targets',false,false] spawn BIS_fnc_MP;",1];
rc1_4 addAction ["Prepare Targets","[[0],'meu_Func_NW_targets',false,false] spawn BIS_fnc_MP;",1];
rc1_5 addAction ["Prepare Targets","[[0],'meu_Func_S_targets',false,false] spawn BIS_fnc_MP;",1];

// Add some actions to Rifle Range Area.
rc1 addAction ["200m Targets Up","[[0],'meu_Func_200_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["200m Targets Down","[[1],'meu_Func_200_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["300m Targets Up","[[0],'meu_Func_300_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["300m Targets Down","[[1],'meu_Func_300_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["500m Targets Up","[[0],'meu_Func_500_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["500m Targets Down","[[1],'meu_Func_500_targets',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["Clear Score","[[player],'meu_Func_clear_my_score',false,false] spawn BIS_fnc_MP;"];
rc1 addAction ["Clear All Scores","[[[]],'meu_Func_clear_all_scores',false,false] spawn BIS_fnc_MP;",1];
rc1 addAction ["Score Board","nop = [] spawn meu_Func_callScoreBoard;",1];
Start1 = [[rc1, [("Range Master Loadout"), "execVM 'scripts\Courses\Recruit\box_rangemaster.sqf';"]], "addAction", true, true] call BIS_fnc_MP;

// Unknown Distance Area
rc2 addAction ["Start Uknown Dist Course","[[],'meu_Func_Ukn_Dst_Random',false,false] spawn BIS_fnc_MP;",1];
rc2 addAction ["Clear Score","[[player],'meu_Func_clear_my_score',false,false] spawn BIS_fnc_MP;"];
rc2 addAction ["Clear All Scores","[[[]],'meu_Func_clear_all_scores',false,false] spawn BIS_fnc_MP;",1];
rc2 addAction ["Score Board","nop = [] spawn meu_Func_callScoreBoard;",1];
Start2 = [[rc2, [("Range Master Loadout"), "execVM 'scripts\Courses\Recruit\box_rangemaster.sqf';"]], "addAction", true, true] call BIS_fnc_MP;
