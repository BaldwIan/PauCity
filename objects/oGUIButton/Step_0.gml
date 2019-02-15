// Mouse hovering button
if	(distance_to_point(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) <= 1)	// For controller later (id == global.buttons[global.buttonSelected])
{
	image_index = 1;
	
	if (gamepad_button_check(0, global.GPInteract) || mouse_check_button_pressed(global.MBInteract))
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
