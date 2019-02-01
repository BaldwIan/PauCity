// Set hotkeys
global.HKTablet = ord("E");

// Set GUI Button Actions
enum buttonActions
{
	no_action,
	exit_game,
	destroy_self,
	goto_room,
	GUIJournalswitch,
}

// Set GUI Slider Actions
enum sliderActions
{
	no_action,
	volume,
}

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
