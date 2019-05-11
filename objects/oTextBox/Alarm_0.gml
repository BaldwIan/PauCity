/// @description Letter for cur dialogue
letIndex++;

var curChar = string_char_at(text[texIndex], letIndex);	// Sub string
visText += curChar
audio_sound_pitch(sndTypeTick, random_range(0.35, 0.625));
audio_play_sound(sndTypeTick, 1.0, false);

var resetTime = room_speed * 0.5;


// If cur dialogue filled out
if (letIndex > string_length(text[texIndex]))
{
	texIndex++;
	if (texIndex > array_length_1d(text))
	{
		alarm[1] = 1;
	}
	letIndex = 0;
	
	
	alarm[1] = resetTime;
} else
{
	resetTime = room_speed * 0.1;
}

if (curChar == "." || curChar == ",") resetTime *= 4;
alarm[0] = resetTime;
