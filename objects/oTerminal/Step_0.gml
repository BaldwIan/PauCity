activatable = !global.GUIUp && !activated && distance_to_object(oPlayer) < 96;
if (activatable)
{
	image_index = 1;
	
	// change text alpha
	textAlpha += 0.04;
	textAlpha = clamp(textAlpha, 0, 0.6);

	// Check for interaction
	var kInteracting = keyboard_check_pressed(global.HKInteract);
	var gInteracting = gamepad_button_check_pressed(0, global.GPInteract);
	var interacting =  kInteracting || gInteracting;
	
	if (interacting)
	{
		// Set puzzle to active
		global.PText = "";  // Reset text for backup
		global.PTargetString = newPuzzleText;
		global.PHint = newPuzzleHint;
		
		// For this
		activated = true; // Can no longer be activated
		
		// Make pop-up showing new puzzle
		var popup = instance_create_layer(x, y, "GUI", oGUIPopUp);
		with (popup)
		{
			mode = popup_actions.puzzle;
		}
	}
} else // Not activatable
{
	image_index = 0;
	
	activatable = false;
	textAlpha -= 0.04;
}


