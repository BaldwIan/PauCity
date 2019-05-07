/// @description Letter for cur dialogue
letIndex++;
visText += string_copy(text[texIndex], letIndex, 1);	// Sub string

// If cur dialogue filled out
if (letIndex > string_length(text[texIndex]))
{
	texIndex++;
	if (texIndex > array_length_1d(text))
	{
		alarm[1] = 1;
	}
	letIndex = 0;
	
	var resetTime = room_speed * 0.5;
	alarm[0] = resetTime;
	alarm[1] = resetTime;
} else
{
	alarm[0] = room_speed * 0.1;
}