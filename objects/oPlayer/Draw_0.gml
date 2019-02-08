if (onGround)
{
	if (velocity_[0] == 0) sprite_index = sPlayerIdle;
	else sprite_index = sPlayerWalk;
}
draw_self();
