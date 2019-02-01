// Mouse hovering button
if (distance_to_point(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) <= 1)
{
	image_index = 1;
	
	if (mouse_check_button_pressed(mb_left))
	{
		#region actions
		
		switch (action)
		{
		case buttonActions.GUIJournalSwitch:
			
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
