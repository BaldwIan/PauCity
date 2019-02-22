// Mouse hovering button
if (distance_to_point(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) <= 1)
{
	image_index = 1;
	
	if (mouse_check_button_pressed(global.MBInteract))// ||)
	{
		#region actions
		
		switch (action)
		{
		case button_actions.Tjournal_switch:
			oGUITablet.mode = tablet_mode.journal;
			break;
			
		case button_actions.Tpuzzle_switch:
			oGUITablet.mode = tablet_mode.puzzle;
			
		default:
			break;
		}
		
		#endregion actions
	}
	
} else // Mouse off button
{
	image_index = 0;
}
