if (distance_to_point(mouse_x, mouse_y) <= 1) // Mouse over self
{
	if (mouse_check_button(mb_left))
	{
		val = abs(x - mouse_x) / sprite_get_width(sprUISliderBar);
		
	}
}

bX = x + sprite_get_width(sprUISliderBar) * val;
