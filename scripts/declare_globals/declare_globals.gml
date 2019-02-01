#region hotkeys

// Set hotkeys
global.HKTablet = ord("Q");
global.HKInteract = ord("E");

#endregion hotkeys

#region GUI

#region button_actions

// Set GUI Button Actions
enum buttonActions
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
enum sliderActions
{
	no_action,
	volume,
}

#endregion slider_actions

#region journal

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

#endregion journal

#endregion GUI
