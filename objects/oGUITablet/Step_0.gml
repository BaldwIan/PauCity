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

if ((mouse_wheel_up() || gamepad_button_check_pressed(0, global.GPUp)) && journalSelected -1 >= 0) 
{
	journalSelected--;
}
else if ((mouse_wheel_down() || gamepad_button_check_pressed(0, global.GPDown)) && journalSelected < ds_grid_height(global.journal)-1) 
{
	journalSelected++;
}
