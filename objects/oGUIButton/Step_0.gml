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
		case button_actions.no_action:
			break;
			
		case button_actions.exit_game:
			game_end();
			break;
			
		case button_actions.destroy_self:
			instance_destroy(self);
			break;
			
		case button_actions.goto_room:
			room_goto(_room);
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
