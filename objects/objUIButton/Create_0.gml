enum actions
{
	no_action,
	exit_game,
	destroy_self,
}
actionTexts = ["NaN", "Exit Game", "Destroy Self"];

action = actions.no_action;
alarm[1] = 1; // Alarm to set text must be alarm when action is set in creation code
