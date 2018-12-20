enum actions
{
	no_action,
	exit_game,
	destroy_self,
	goto_room,
}

_room = room;
action = actions.no_action;
alarm[1] = 1; // Naming works depending on corresponding index in actionTexts
