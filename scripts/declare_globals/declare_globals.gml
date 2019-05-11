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
global.tabletNotification = false;

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


// Terminal types
enum terminal_modes
{
	none,
	puzzle,
	journal,
}

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
	none,
	getJournal,
	spawnBox1,
	exitRoom,
	enterRoom,
	linch,
}

// Action Types
#region cts_acts

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
	cam_change_zoom,
	cam_change_pos,
	xScale,
	yScale,
	stop,
	create,
	destroy,
	fade_out_black,
	fade_in_black,
	next_room,
}

#endregion cts_acts


// Make cutscenes - last term in data[] will be time in seconds for action to last
#region none_cts

add_anim(cts.none, oPlayer, cts_actions.change_obj, [oCPlayer, 1]);
//add_anim(cts.none, undefined, cts_actions.cam_change_follow, [oCPlayer, 0]);	// Uncomment to follow player
add_anim(cts.spawnBox1, undefined, cts_actions.cam_change_zoom, [global.regCWidth * 0.9, global.regCHeight * 0.9, 0]);

// Contents for cts go here

add_anim(cts.none, oCPlayer, cts_actions.change_obj, [oPlayer, 0]);
add_anim(cts.none, undefined, cts_actions.cam_change_mode, [cammode.follow_object, 0]);
add_anim(cts.none, undefined, cts_actions.cam_change_follow, [oPlayer, 0]);
add_anim(cts.none, undefined, cts_actions.cam_change_zoom, [global.regCWidth, global.regCHeight, 0]);

#endregion none_cts

#region get_journal_cts
// First cutscene
/*
add_anim(cts.getJournal, undefined, cts_actions.cam_change_zoom, [global.regCWidth * 0.8, global.regCHeight * 0.8, 0]);
add_anim(cts.getJournal, oCPlayer, cts_actions.move, [1, 0.5]);										// Move player			
add_anim(cts.getJournal, undefined, cts_actions.cam_change_offset, [-150, 0, 0]);					// Camera on detective
add_anim(cts.getJournal, undefined, cts_actions.cam_change_follow, [oCDetective, 0]);				
add_anim(cts.getJournal, undefined, cts_actions.wait, [1, 0.5]);									
add_anim(cts.getJournal, oCPlayer, cts_actions.xScale, [-1, 0]);									// Look back at detective
add_anim(cts.getJournal, undefined, cts_actions.wait, [0.5]);										
add_anim(cts.getJournal, oCPlayer, cts_actions.move, [1, 1]);										// Move out of room
add_anim(cts.getJournal, oCDetective, cts_actions.move, [-1, 0.75]);								// Move detective off
add_anim(cts.getJournal, oCPlayer, cts_actions.stop, [0]);											// Stop and get journal with dialogue
add_anim(cts.getJournal, oCTablet, cts_actions.create, [540, 1450, "Dynamic", 0]);
add_anim(cts.getJournal, undefined, cts_actions.dialogue, [650, 1460,
														  ["It's been 3 days, you are the only detective worthy enough.",
															"We've recently become certain that it WAS the entire city.", 
															"As always, any information you find will be logged in your tablet for this mission.",
															"The best of luck. I'll be keeping VERY close watch over the situation."
															],
															30]);
add_anim(cts.getJournal, oCTablet, cts_actions.move, [-1, 0.07]);									// Move journal to player
add_anim(cts.getJournal, oCTablet, cts_actions.jump, [0]);
add_anim(cts.getJournal, oCTablet, cts_actions.move, [-1, 0.07]);									// Move journal to player
add_anim(cts.getJournal, undefined, cts_actions.wait, [0.2]);
add_anim(cts.getJournal, oCTablet, cts_actions.destroy, [0]);
add_anim(cts.getJournal, oCPlayer, cts_actions.move, [1, 1.75]);									// Move player out of house
add_anim(cts.getJournal, oCPlayer, cts_actions.stop, [0]);
add_anim(cts.getJournal, oCPlayer, cts_actions.cam_change_mode, [cammode.follow_object, 0]);		// Camera on player

add_anim(cts.getJournal, undefined, cts_actions.cam_change_zoom, [global.regCWidth * 0.82, global.regCHeight * 0.82, 0]);
add_anim(cts.getJournal, undefined, cts_actions.cam_change_follow, [oCPlayer, 0]);
add_anim(cts.getJournal, oCPlayer, cts_actions.xScale, [-1, 0]);

add_anim(cts.getJournal, oCPlayer, cts_actions.wait, [0.5]);										// Approaching end
add_anim(cts.getJournal, oCDetective, cts_actions.move, [-1, 1]);									// 
add_anim(cts.getJournal, undefined, cts_actions.cam_change_offset, [0, 0, 0]);
add_anim(cts.getJournal, oCDetective, cts_actions.xScale, [-1, 0]);
add_anim(cts.getJournal, oSolid, cts_actions.create, [910, 1530, "oCollision",  0]);	*/


// Final cleanup of cutscene and make player moveable
add_anim(cts.getJournal, oCPlayer, cts_actions.change_obj, [oPlayer, 0]);
add_anim(cts.getJournal, oCPlayer, cts_actions.cam_change_mode, [cammode.follow_object, 0]);
add_anim(cts.getJournal, undefined, cts_actions.cam_change_offset, [0, 0, 0]);	// Reset camera offset
add_anim(cts.getJournal, oCPlayer, cts_actions.cam_change_follow, [oPlayer, 0]);
// Destroy detective
add_anim(cts.getJournal, oCDetective, cts_actions.destroy, [0]);
add_anim(cts.getJournal, undefined, cts_actions.cam_change_zoom, [global.regCWidth, global.regCHeight, 0]);

#endregion get_journal_cts

#region spawn_box1

add_anim(cts.spawnBox1, oPlayer, cts_actions.change_obj, [oCPlayer, 1]);
add_anim(cts.spawnBox1, oPushable, cts_actions.create, [1405, 2685, "Interactive", 0]);
add_anim(cts.spawnBox1, undefined, cts_actions.cam_change_mode, [cammode.move_to_target, 0]);
add_anim(cts.spawnBox1, undefined, cts_actions.cam_change_zoom, [global.regCWidth * 0.9, global.regCHeight * 0.9, 0]);
add_anim(cts.spawnBox1, undefined, cts_actions.cam_change_pos, [1405, 2685, 2]);
add_anim(cts.spawnBox1, oCPlayer, cts_actions.change_obj, [oPlayer, 0]);
add_anim(cts.spawnBox1, undefined, cts_actions.cam_change_mode, [cammode.follow_object, 0]);
add_anim(cts.spawnBox1, undefined, cts_actions.cam_change_follow, [oPlayer, 0]);
add_anim(cts.spawnBox1, undefined, cts_actions.cam_change_zoom, [global.regCWidth, global.regCHeight, 0]);

#endregion spawn_box1

#region exit_room

// Start
add_anim(cts.exitRoom, undefined, cts_actions.cam_change_zoom, [global.regCWidth * 0.9, global.regCHeight * 0.9, 0]);
add_anim(cts.exitRoom, oPlayer, cts_actions.change_obj, [oCPlayer, 0]);
add_anim(cts.exitRoom, undefined, cts_actions.cam_change_follow, [oCPlayer, 0]);	// Uncomment to follow player


// Contents
add_anim(cts.exitRoom, undefined, cts_actions.fade_out_black, [0]);
add_anim(cts.exitRoom, oCPlayer, cts_actions.move, [1, 5]);
add_anim(cts.exitRoom, undefined, cts_actions.next_room, [0]);

// Cleanup
add_anim(cts.exitRoom, undefined, cts_actions.cam_change_zoom, [global.regCWidth, global.regCHeight, 0]);

#endregion exit_room

#region enter_room

add_anim(cts.enterRoom, oPlayer, cts_actions.change_obj, [oCPlayer, 0]);
add_anim(cts.enterRoom, undefined, cts_actions.cam_change_follow, [oCPlayer, 0]);	// Uncomment to follow player
add_anim(cts.enterRoom, undefined, cts_actions.cam_change_zoom, [global.regCWidth * 0.9, global.regCHeight * 0.9, 0]);

add_anim(cts.enterRoom, undefined, cts_actions.fade_in_black, [0]);
add_anim(cts.enterRoom, oCPlayer, cts_actions.move, [1, 3]);

add_anim(cts.enterRoom, oCPlayer, cts_actions.change_obj, [oPlayer, 0]);
add_anim(cts.enterRoom, undefined, cts_actions.cam_change_mode, [cammode.follow_object, 0]);
add_anim(cts.enterRoom, undefined, cts_actions.cam_change_follow, [oPlayer, 0]);
add_anim(cts.enterRoom, undefined, cts_actions.cam_change_zoom, [global.regCWidth, global.regCHeight, 0]);

#endregion enter_room

#region linch

add_anim(cts.linch, undefined, cts_actions.cam_change_zoom, [global.regCWidth * 0.9, global.regCHeight * 0.9, 0]);
add_anim(cts.linch, oPlayer, cts_actions.change_obj, [oCPlayer, 0]);
add_anim(cts.none, undefined, cts_actions.cam_change_follow, [oCPlayer, 0]);	// Uncomment to follow player

// Contents for cts go here

add_anim(cts.none, oCPlayer, cts_actions.change_obj, [oPlayer, 0]);
add_anim(cts.none, undefined, cts_actions.cam_change_mode, [cammode.follow_object, 0]);
add_anim(cts.none, undefined, cts_actions.cam_change_follow, [oPlayer, 0]);
add_anim(cts.none, undefined, cts_actions.cam_change_zoom, [global.regCWidth, global.regCHeight, 0]);

#endregion linch


#endregion cutscene
