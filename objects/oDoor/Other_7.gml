/// @description Change after flashing
if (sprite_index == sDoorFlashing)
{
	sprite_index = sDoorOpened;
	if (place_meeting(x, y, oSolid)) position_destroy(x, y);
}
