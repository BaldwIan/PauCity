// Draw BG with parallax
for (i = array_length_1d(BG)-1; i >= 0; i--)
{
	draw_sprite(BG[i], 0, x - cwidth + BGOffset * (i/array_length_1d(BG)), y);
}
