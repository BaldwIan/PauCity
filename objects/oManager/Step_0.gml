// Play main song loop
if (!audio_is_playing(musMainLoop) && !audio_is_playing(musMainIntro))
{
	audio_play_sound(musMainLoop, 1, true);
}

// Open door if puzzle is solved
// increment curDoor to access next door
if (global.PSolved)
{
	global.PSolved = false;
	var curDoor = global.PDoors[global.curPDoor];
	if (curDoor.sprite_index == sDoor) curDoor.sprite_index = sDoorFlashing;
	if (global.curPDoor+1 > array_length_1d(global.PDoors)) global.curPDoor++;
}
