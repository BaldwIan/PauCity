/// @description Change after flashing
if (sprite_index == sDoorFlashing)
{
	sprite_index = sDoorOpened;
	if (place_meeting(x, y, oSolid))
	{
		// Reset camera zoom
		oCamera.wTo = global.regCWidth;
		oCamera.hTo = global.regCHeight;
		
		with (oCamera)
		{
			mode = cammode.follow_object;
			following = oPlayer;
		}
		position_destroy(x, y);
		
	}
}
