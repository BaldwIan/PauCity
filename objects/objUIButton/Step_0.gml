// Mouse hovering button
if (distance_to_point(mouse_x, mouse_y) <= 1)
{
	image_index = 1;
	
	if (mouse_check_button_pressed(mb_left))
	{
		audio_play_sound(sndClick, 1, false);
		#region actions
		switch (action)
		{
		case actions.no_action:
			break;
			
		case actions.exit_game:
			game_end();
			break;
			
		case actions.destroy_self:
			instance_destroy(self);
			break;
			
		case actions.goto_room:
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
