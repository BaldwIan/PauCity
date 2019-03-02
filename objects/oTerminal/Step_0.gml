activatable = !global.GUIUp && !activated && distance_to_object(oPlayer) < 96;
if (activatable)
{
	// change text alpha
	textAlpha += 0.04;
	textAlpha = clamp(textAlpha, 0, 0.6);

	// Check for interaction
	var kInteracting = keyboard_check_pressed(global.HKInteract);
	var gInteracting = gamepad_button_check_pressed(0, global.GPInteract);
	var interacting =  kInteracting || gInteracting;
	
	if (interacting)
	{
		activated = true; // Can no longer be activated
		var popup = instance_create_layer(x, y, "GUI", oGUIPopUp);
		with (popup)
		{
			mode = popup_actions.puzzle;
		}
	}
}else // Not activatable
{
	activatable = false;
	textAlpha -= 0.04;
}


