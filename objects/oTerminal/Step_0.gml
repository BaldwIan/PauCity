activatable = !global.GUIUp && !activated && distance_to_object(oPlayer) < 96;
if (activatable)
{
	image_index = 1;
	
	// change text alpha
	textAlpha = clamp(textAlpha + 0.04, 0, 0.6);

	// Check for interaction
	var kInteracting = keyboard_check_pressed(global.HKInteract);			// Keyboard interaction
	var gInteracting = gamepad_button_check_pressed(0, global.GPInteract);	// Gamepad interaciton
	var interacting =  kInteracting || gInteracting;
	
	if (interacting)
	{
		// Notification
		global.tabletNotification = true;
		audio_play_sound(sndNotification, 1.0, false);
		
		activated = true; // Can no longer be activated
		
		// Make pop-up showing new puzzle
		var popup = instance_create_layer(x, y, "GUI", oGUIPopUp);
		
		switch (mode)
		{
		case terminal_modes.none:
			break;
			
		case terminal_modes.journal:
			add_journal_entry(jTitle, jContent, jDate, jAuthor);
		
			// Door will block every terminal
			if (opensDoor) global.PSolved = true;
			break;
		
			// journal entry from creation
			add_journal_entry(jTitle, jContent, jDate, jAuthor);
			
			// Set pop-up mode
			popup.mode = popup_actions.journal;
			
			break;
			
		case terminal_modes.puzzle:
			// Set puzzle to active
			global.PText = "";  // Reset text for backup
			global.PTargetString = newPuzzleText;
			global.PHint = newPuzzleHint;
			
			// Set pop-up mode
			popup.mode = popup_actions.puzzle;
			
			show_debug_message("terminal pop-up");
			
			break;
			
		default:
			break;
		}
	}
} else // Not activatable
{
	image_index = 0;
	
	activatable = false;
	textAlpha -= 0.04;
}


