if (distance_to_point(mouse_x, mouse_y) <= 1) && (mouse_check_button(mb_left))
{
	active = true;
} else if (!mouse_check_button(mb_left))
{
	active = false;
}

if (active)
{
	val = (mouse_x - x) / sprite_get_width(sprUISliderBar);
}

val = clamp(val, 0, cap);
bX = x + sprite_get_width(sprUISliderBar) * val;
