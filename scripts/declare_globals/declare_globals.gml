#region hotkeys

// Movement
global.HKUp = gp_face1;
global.HKLeft = ord("A");
global.HKDown = ord("S");
global.HKRight = ord("D");

// UI
global.HKTablet = gp_start;
global.HKInteract = gp_face3; //ord("E");

#endregion hotkeys

#region GUI

// Button Selected
global.buttonSelected = 0;
// List of buttons in room
global.buttons = [];

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

global.cwidth = 960;
global.cheight = 540;

#endregion camera
