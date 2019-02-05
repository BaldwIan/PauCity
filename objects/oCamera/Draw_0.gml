// Draw BG with parallax
for (i = 0; i < array_length_1d(BG); i++)
{
	draw_sprite(BG[i], 0, x - BGOffset * i, y);
}
