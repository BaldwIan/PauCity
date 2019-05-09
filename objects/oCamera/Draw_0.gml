// Draw BG with parallax
for (i = 0; i < array_length_1d(BG); i++)
{
	var BGOffset = (room_width - x);
	var bX =  x + (BGOffset * (i/array_length_1d(BG)));
	var bY = y - sprite_get_height(sBGDefault)/2;
	//var bScale = global.cheight / global.regCHeight;
	draw_sprite_tiled_ext(BG[i], 0, bX, bY, 1, 1, c_white, 1);
}
