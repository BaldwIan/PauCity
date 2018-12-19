// Mouse hovering button
if (distance_to_point(mouse_x, mouse_y) <= 1)
{
	image_index = 1;
	
	if (mouse_check_button_pressed(mb_left))
	{
		#region actions
		switch (action)
		{
		case actions.exit_game:
			game_end();
			
		case actions.destroy_self:
			instance_destroy(self);
		}
		#endregion actions
	}
	
} else // Mouse off button
{
	image_index = 0;
}
