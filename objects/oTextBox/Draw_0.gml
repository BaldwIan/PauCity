// Draw vars
var sWidth = sprite_get_width(sprite_index);

draw_self();

// Draw cur text
draw_set_font(fntGame);
draw_text_ext(bbox_left + 4, bbox_top + 4, visText, 16, sWidth - 8);
draw_set_font(fntDefault);
