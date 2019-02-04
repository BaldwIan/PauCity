// Play main song loop
if (!audio_is_playing(musMainLoop) && !audio_is_playing(musMainIntro))
{
	audio_play_sound(musMainLoop, 1, true);
}
