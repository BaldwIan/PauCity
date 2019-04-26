/// @description Move to position (closed or open)
if (mode == tablet_mode.closed)
{
	global.GUIUp = false;
	// Position
	y = lerp(y, display_get_gui_height()+10, 0.25);
	// Button position
	buttonJournal.y = lerp(buttonJournal.y, bbox_top, 0.7);
	buttonPuzzle.y = lerp(buttonPuzzle.y, bbox_top, 0.7);
} else
{
	global.GUIUp = true;
	// Position
	var tabBHeight = sprite_get_height(sGUITabletButton);
	var dHeight = display_get_height();
	y = lerp(y, dHeight/2 - sprite_get_height(sGUITabletBase)/4, 0.15);
	// Button position
	buttonJournal.y = lerp(buttonJournal.y, bbox_top - tabBHeight, 0.3);
	buttonPuzzle.y = lerp(buttonPuzzle.y, bbox_top - tabBHeight, 0.3);
}

if (gamepad_button_check_pressed(0, global.GPTablet) || keyboard_check_pressed(global.HKTablet))
{
	switch (mode)
	{
	case (tablet_mode.closed):
		mode = lastMode;
		break;
		
	default:
		lastMode = mode;
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
	
case tablet_mode.puzzle:
	if (keyboard_check_pressed(vk_anykey))
	{
		kInput = alphabet[alphPos];
		global.PText = string_replace(global.PText, "_", kInput);
		curPIndex++;
		if (curPIndex >= string_length(global.PText))
		{
			if (global.PText == global.PTargetString)
			{
				global.PSolved = true;
			}
			
			curPIndex = 0;
			global.PText = "";
			for (i = 0; i < string_length(global.PTargetString); i++)
			{
				global.PText += "_";
			}
		}
	}
	
	if (keyboard_check_pressed(vk_right)) alphPos++;
	else if (keyboard_check_pressed(vk_left)) alphPos--;
	
	break;
	
default:
	break;
}
