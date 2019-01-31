// Mouse hovering button
if (distance_to_point(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) <= 1)
{
	image_index = 1;
	
	if (mouse_check_button_pressed(mb_left))
	{
		audio_play_sound(sndClick, 1, false);
		#region actions
		switch (action)
		{
		case buttonActions.no_action:
			break;
			
		case buttonActions.exit_game:
			game_end();
			break;
			
		case buttonActions.destroy_self:
			instance_destroy(self);
			break;
			
		case buttonActions.goto_room:
			room_goto(_room);
			break;
			
		case buttonActions.GUIJournalswitch:
			
			break;
			
		default:
			break;
		}
		#endregion actions
	}
	
} else // Mouse off button
{
	image_index = 0;
}
