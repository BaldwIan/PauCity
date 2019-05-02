// Script will only be used at start of game

#region hotkeys

// Controller
#region movement
global.GPJump = gp_face1;
//global.GPVert = gp_axislv;
//global.GPHoriz = gp_axislh;
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
//global.HKDown = ord("S");
global.HKRight = ord("D");
#endregion movement
#region control
global.HKTablet = ord("Q");
global.HKInteract = ord("E");
global.HKConfirm = vk_enter;
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
global.tabletMode = tablet_mode.closed;

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

global.regCWidth = 960;
global.regCHeight = 540;
global.cwidth = global.regCWidth;
global.cheight = global.regCHeight;

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
global.PText = "_";
global.PTargetString = "x";

#endregion puzzle

#region cutscene

global.ctsPos = -1;		// current action in current cutscene 
global.ctsType = -1;	// current cutscene

global.ctsAnims = [];

// Cutscenes
enum cts
{
	testC,
}

// Action Types
enum cts_actions
{
	wait,
	move,
	jump,
	dialogue,
}


// Make cutscenes - last term in data[] will be time in seconds for action to last
// Test cutscene
add_anim(cts.testC, oCPlayer, cts_actions.move, [1, 4]);
add_anim(cts.testC, oCPlayer, cts_actions.move, [-1, 0.25]);
repeat(6)
{
	add_anim(cts.testC, oCPlayer, cts_actions.jump, [0.1]);
	add_anim(cts.testC, undefined, cts_actions.wait, [0.1]);
	add_anim(cts.testC, oCPlayer, cts_actions.move, [-1, 0.5]);
}

#endregion cutscene
