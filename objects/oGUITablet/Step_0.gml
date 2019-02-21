/// @description Move to position
if (mode == tablet_mode.closed)
{
	y = lerp(y, display_get_gui_height()+10, 0.25);
} else
{
	y = lerp(y, display_get_gui_height()/2 - sprite_get_height(sprite_index)/2 + sprite_get_height(sGUIJournalButton), 0.15);
}

if (gamepad_button_check_pressed(0, global.GPTablet) || keyboard_check_pressed(global.HKTablet))
{
	switch (mode)
	{
	case (tablet_mode.closed):
		mode = tablet_mode.journal;
		break;
		
	default:
		mode = tablet_mode.closed;
		break;
	}
}



switch (mode)
{
case tablet_mode.closed:
	break;
	
case tablet_mode.journal:
	var scrollUp = (mouse_wheel_up() || gamepad_button_check_pressed(0, global.GPUp));
	var scrollDown = (mouse_wheel_down() || gamepad_button_check_pressed(0, global.GPDown));
	if (scrollUp ^^ scrollDown)
	{
		if (scrollUp)
		{
			JSelected = clamp(JSelected-1, 0, ds_grid_height(global.journal)-1);
		} else
		{
			JSelected = clamp(JSelected+1, 0, ds_grid_height(global.journal)-1);
		}
	
		if (JSelected < JScrolledAmount) JScrolledAmount--;
		else if (JSelected > JScrolledAmount-1 + JShownEntries) JScrolledAmount++;
	}
}
