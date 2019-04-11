#region hotkeys

// Controller
#region movement
global.GPJump = gp_face1;
global.GPVert = gp_axislv;
global.GPHoriz = gp_axislh;
#endregion movement
#region control
global.GPTablet = gp_start;
global.GPInteract = gp_face3;
global.GPUp = gp_padu;
global.GPDown = gp_padd;
#endregion control

// Keyboard
#region movement
global.HKJump = vk_space;
global.HKLeft = ord("A");
global.HKDown = ord("S");
global.HKRight = ord("D");
#endregion movement
#region control
global.HKTablet = ord("Q");
global.HKInteract = ord("E");
#endregion control

// Mouse
#region control
global.MBInteract = mb_left;
#endregion control

#endregion hotkeys

#region GUI

// check if any GUI is active
global.GUIUp = false;

#region button_actions

// Set GUI Button Actions
enum button_actions
{
	no_action,
	exit_game,
	destroy_self,
	goto_room,
	Tjournal_switch,
	Tpuzzle_switch,
}

#endregion button_actions

#region slider_actions

// Set GUI Slider Actions
enum slider_actions
{
	no_action,
	volume,
}

#endregion slider_actions

#region popup_actions

enum popup_actions
{
	mystery,
	journal,
	puzzle,
}

#endregion popup_actions

#region tablet

enum tablet_mode
{
	journal,
	puzzle,
	closed,
}
global.tabletMode = tablet_mode.closed

#endregion tablet
#region tJournal

// Set Journal Vars
global.journalWidth = 4;
global.journal = ds_grid_create(global.journalWidth, 0);
enum journal
{
	title,
	content,
	date,
	author,
}

#endregion tJournal

#endregion GUI

#region camera

enum cammode
{
	follow_object,
	follow_mouse_drag,
	follow_mouse_border,
	follow_mouse_peak,
	move_to_target,
	shake,
	shake_follow,
}

global.cwidth = 960;
global.cheight = 540;

#endregion camera

#region puzzle

// Puzzle types
/*	FOR LATER USE
enum puzzles
{
	none,
	color_patern,
	memory,
	connect_lines,
}*/
//global.PActiveType = puzzles.none;	MIGHT BE USED LATER IF NOT WORD PUZZLES
global.PSolved = false;				// When true, door will open
global.PDoors = [];					// List of doors in room, set in creation code of doors
global.curPDoor = 0;				// Used for indexing door list
global.PHint = "No Puzzle Active";
global.PText = "";
global.PTargetString = undefined;

#endregion puzzle
