enum buttonActions
{
	no_action,
	exit_game,
	destroy_self,
	goto_room,
	closeJournal,
}

_room = room;
action = buttonActions.no_action;
alarm[1] = 1; // Naming works depending on corresponding index in actionTexts
