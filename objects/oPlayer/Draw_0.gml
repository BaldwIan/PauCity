if (onGround)
{
	if (image_xscale == 0) image_xscale = 1;
	if (abs(velocity_[0]) < 0.3 || global.GUIUp) sprite_index = sPlayerIdle;
	else sprite_index = sPlayerWalk;
	
} else
{
	if (velocity_[1] > 0) sprite_index = sPlayerFall;
	else if (velocity_[1] < 0) sprite_index = sPlayerJump;
}
var newXScale = sign(velocity_[0]);
if (newXScale == 0) newXScale = image_xscale;
image_xscale = newXScale;
draw_self();
