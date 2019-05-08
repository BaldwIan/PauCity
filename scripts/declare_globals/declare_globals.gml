// Script will only be used at start of game

#region hotkeys

// Controller
#region movement
global.GPJump = gp_face1;
//global.GPVert = gp_axislv;
//global.GPHoriz = gp_axislh;
#endregion movement
#region control
global.GPTablet   = gp_start;
global.GPInteract = gp_face3;
global.GPUp    = gp_padu;
global.GPDown  = gp_padd;
global.GPLeft  = gp_padl;
global.GPRight = gp_padr;
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
	follow_point_peak,
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
	getJournal,
}

// Action Types
enum cts_actions
{
	wait,
	move,
	jump,
	change_obj,
	dialogue,
	cam_change_mode,
	cam_change_follow,
	cam_change_offset,
	xScale,
	yScale,
	stop,
	create,
	destroy,
}


// Make cutscenes - last term in data[] will be time in seconds for action to last
// First cutscene

add_anim(cts.getJournal, undefined, cts_actions.wait, [0.1]);										// Move player
add_anim(cts.getJournal, oCPlayer, cts_actions.move, [1, 0.5]);										
add_anim(cts.getJournal, undefined, cts_actions.cam_change_offset, [128, 0, 0.1]);					// Camera on detective
add_anim(cts.getJournal, undefined, cts_actions.cam_change_follow, [oCDetective, 0.1]);				
add_anim(cts.getJournal, undefined, cts_actions.wait, [1, 0.5]);									
add_anim(cts.getJournal, oCPlayer, cts_actions.move, [-1, 0.05]);									// Look back at detective
add_anim(cts.getJournal, undefined, cts_actions.wait, [0.5]);										
add_anim(cts.getJournal, oCPlayer, cts_actions.move, [1, 1]);										// Move out of room
add_anim(cts.getJournal, oCDetective, cts_actions.move, [-1, 0.75]);								// Move detective off
add_anim(cts.getJournal, undefined, cts_actions.stop, [1]);											// Stop and get journal with dialogue
// Add dialogue // to be added
// More walking out of room
add_anim(cts.getJournal, oCPlayer, cts_actions.move, [1, 1.75]);									// Move player out of house
add_anim(cts.getJournal, oCPlayer, cts_actions.stop, [0.01]);
add_anim(cts.getJournal, oCPlayer, cts_actions.cam_change_mode, [cammode.follow_object, 0.1]);		// Camera on player
add_anim(cts.getJournal, undefined, cts_actions.cam_change_follow, [oPlayer, 0.1]);
add_anim(cts.getJournal, oCPlayer, cts_actions.xScale, [-1, 0.01]);


add_anim(cts.getJournal, oCPlayer, cts_actions.wait, [0.5]);
add_anim(cts.getJournal, oCDetective, cts_actions.move, [-1, 1]);
add_anim(cts.getJournal, undefined, cts_actions.cam_change_offset, [0, 0, 0.01]);
add_anim(cts.getJournal, undefined, cts_actions.cam_change_follow, [oCPlayer, 0.01]);
add_anim(cts.getJournal, oCDetective, cts_actions.move, [-1, 0.1]);
add_anim(cts.getJournal, oSolid, cts_actions.create, [920, 1540, "oCollision",  0.01]);


// Final cleanup of cutscene and make player moveable
add_anim(cts.getJournal, oCPlayer, cts_actions.change_obj, [oPlayer, 0.1]);
add_anim(cts.getJournal, oCPlayer, cts_actions.cam_change_mode, [cammode.follow_object, 0.1]);
add_anim(cts.getJournal, undefined, cts_actions.cam_change_offset, [0, 0, 0.01]);	// Reset camera offset
add_anim(cts.getJournal, oCPlayer, cts_actions.cam_change_follow, [oPlayer, 0.1]);
// Destroy detective
add_anim(cts.getJournal, oCDetective, cts_actions.destroy, [0.01]);


#endregion cutscene
