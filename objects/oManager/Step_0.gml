// Play main song loop
if (!audio_is_playing(musMainLoop) && !audio_is_playing(musMainIntro))
{
	audio_play_sound(musMainLoop, 1, true);
}

// Open door if puzzle is solved
// increment curDoor to access next door
if (global.PSolved)
{
	show_debug_message("In manager PDoors = " + string(global.PDoors));
	global.PSolved = false;
	global.PDoors[global.curPDoor].sprite_index = sDoorFlashing;
	global.curPDoor++;
}
