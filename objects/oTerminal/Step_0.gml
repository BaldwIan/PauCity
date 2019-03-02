// player detection
if (distance_to_object(oPlayer) < 96) {
	activatable = true;
	textAlpha += 0.04;
}
else {
	activatable = false;
	textAlpha -= 0.04;
}
textAlpha = clamp(textAlpha, 0, 0.6);

var kInteracting = keyboard_check_pressed(global.HKInteract);
var gInteracting = gamepad_button_check_pressed(0, global.GPInteract);
var interacting =  kInteracting || gInteracting;
if (interacting && activatable)
{
	var popup = instance_create_layer(x, y, "GUI", oGUIPopUp);
	with (popup)
	{
		mode = popup_actions.puzzle;
	}
}


