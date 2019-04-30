// Play main song loop
if (!audio_is_playing(musMainLoop) && !audio_is_playing(musMainIntro))
{
	audio_play_sound(musMainLoop, 1, true);
}

// Open door if puzzle is solved
// increment curDoor to access next door
if (global.PSolved)
{
	// Door being opened
	var curDoor = global.PDoors[global.curPDoor];
	
	// Door open sound
	audio_play_sound(sndDoorOpen, 1, false);
	
	// Reset puzzle vars
	global.PHint = "No Puzzle Active";
	global.PTargetString = "x";
	global.PText = "_";
	global.PSolved = false;

	
	
	if (curDoor.sprite_index == sDoor) curDoor.sprite_index = sDoorFlashing;
	if (global.curPDoor+1 > array_length_1d(global.PDoors)) global.curPDoor++;
	
	// Zoom in camera, and go to door
	oCamera.wTo = global.regCWidth * 0.75;
	oCamera.hTo = global.regCHeight * 0.75;
	with (oCamera)
	{
		mode = cammode.follow_object;
		following = curDoor;
	}
}
