// Draw BG with parallax
for (i = 0; i < array_length_1d(BG); i++)
{
	var BGOffset = (room_width - x);
	draw_sprite_tiled(BG[i], 0, x + (BGOffset  * (i/array_length_1d(BG))), y - sprite_get_height(sBGDefault)/2);
}