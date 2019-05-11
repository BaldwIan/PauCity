/// @description TEMP DRAW DEV TEXT
var c = c_white;
draw_text_color(45, 45, "Press \"F\" to go to next room", c, c, c, c, 0.5);

if (global.ctsPos >= 0)
{
	draw_sprite(sVignette, 0, 0, 0);
	var b = c_black;
	draw_set_alpha(ctsBlackA);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), b, b, b, b, false);
	draw_set_alpha(1);
}
