class CfgCommunicationMenu
	{

// OSUT Courses		
	class ATMGCourse
		{
			text = "AT/MG Training"; // Text displayed in the menu and in a notification
			submenu = ""; // Submenu opened upon activation
			expression = "Mack_Load = [""scripts\Courses\ITB\ATMG_Course.sqf"",""BIS_fnc_execVM"",false,false] spawn BIS_fnc_MP;"; // Code executed upon activation (ignored when the submenu is not empty)
			icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; // Icon displayed permanently next to the command menu
			cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
			enable = "1"; // Simple expression condition for enabling the item
		};
		
	class BAMCourse
		{
			text = "BAM Course"; // Text displayed in the menu and in a notification
			submenu = ""; // Submenu opened upon activation
			expression = "Mack_Load = [""scripts\Courses\ITB\Bound_Maneuver_Advanced.sqf"",""BIS_fnc_execVM"",false,false] spawn BIS_fnc_MP;"; // Code executed upon activation (ignored when the submenu is not empty)
			icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; // Icon displayed permanently next to the command menu
			cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
			enable = "1"; // Simple expression condition for enabling the item
		};
		
	class GrenadeCourse
		{
			text = "Grenade Course"; // Text displayed in the menu and in a notification
			submenu = ""; // Submenu opened upon activation
			expression = "Mack_Load = [""scripts\Courses\ITB\Grenade_Range.sqf"",""BIS_fnc_execVM"",false,false] spawn BIS_fnc_MP;"; // Code executed upon activation (ignored when the submenu is not empty)
			icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; // Icon displayed permanently next to the command menu
			cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
			enable = "1"; // Simple expression condition for enabling the item
		};
		
	class IDCourse
		{
			text = "Vehicle PID"; // Text displayed in the menu and in a notification
			submenu = ""; // Submenu opened upon activation
			expression = "Mack_Load = [""scripts\Courses\ITB\Identification_Course.sqf"",""BIS_fnc_execVM"",false,false] spawn BIS_fnc_MP;"; // Code executed upon activation (ignored when the submenu is not empty)
			icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; // Icon displayed permanently next to the command menu
			cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
			enable = "1"; // Simple expression condition for enabling the item
		};
		
	class MOUTCourse
		{
			text = "MOUT Training"; // Text displayed in the menu and in a notification
			submenu = ""; // Submenu opened upon activation
			expression = "Mack_Load = [""scripts\Courses\ITB\MOUT_Course.sqf"",""BIS_fnc_execVM"",false,false] spawn BIS_fnc_MP;"; // Code executed upon activation (ignored when the submenu is not empty)
			icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; // Icon displayed permanently next to the command menu
			cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
			enable = "1"; // Simple expression condition for enabling the item
		};
	
// Recruit Instructor	
	class RRCourse
		{
			text = "Rifle Range"; // Text displayed in the menu and in a notification
			submenu = ""; // Submenu opened upon activation
			expression = "Mack_Load = [""scripts\Courses\Recruit\Rifle_Range.sqf"",""BIS_fnc_execVM"",false,false] spawn BIS_fnc_MP;"; // Code executed upon activation (ignored when the submenu is not empty)
			icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; // Icon displayed permanently next to the command menu
			cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
			enable = "1"; // Simple expression condition for enabling the item
		};

// JTAC Courses		
		
	class LIVEFIREAREA
		{
			text = "Live Fire Range"; // Text displayed in the menu and in a notification
			submenu = ""; // Submenu opened upon activation
			expression = "Mack_Load = [""scripts\Courses\JTAC\LiveFire_Course.sqf"",""BIS_fnc_execVM"",false,false] spawn BIS_fnc_MP;"; // Code executed upon activation (ignored when the submenu is not empty)
			icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; // Icon displayed permanently next to the command menu
			cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
			enable = "1"; // Simple expression condition for enabling the item
		};

// Medical Courses
	
};

//[player,""scripts\respawn.sqf""] call BIS_fnc_execVM;"
//Mack_Respawn = [player,""scripts\respawn.sqf"",""BIS_fnc_execVM""] call BIS_fnc_MP;
//[""scripts\respawn.sqf"","BIS_fnc_execVM", false, false] call BIS_fnc_MP;
//["scripts\respawn.sqf","BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;