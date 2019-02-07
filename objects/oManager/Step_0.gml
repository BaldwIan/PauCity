// Play main song loop
if (!audio_is_playing(musMainLoop) && !audio_is_playing(musMainIntro))
{
	audio_play_sound(musMainLoop, 1, true);
}

// transverse through buttons if buttons exist
/*
var hJoyStick = gamepad_axis_value(0, gp_axislv);
if (instance_number(oGUIButton) > 0)
{
	var buttonSelectAmount = 0.9;
	if (hJoyStick > buttonSelectAmount)
	{
		global.buttonSelected--;
	} else if (hJoyStick < -buttonSelectAmount)
	{
		global.buttonSelected++;
	}
	
	global.buttonSelected = clamp(global.butotnSelected, 0, array_length_1d(global.buttons));
}
*/
