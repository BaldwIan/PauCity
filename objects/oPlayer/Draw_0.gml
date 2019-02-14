if (onGround)
{
	image_xscale = sign(velocity_[0]);
	if (image_xscale == 0) image_xscale = 1;
	if (abs(velocity_[0]) < 0.2)
	{
		sprite_index = sPlayerIdle;
	}
	else
	{
		sprite_index = sPlayerWalk;
	}
}
draw_self();
