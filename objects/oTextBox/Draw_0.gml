// Draw vars
var sWidth = sprite_get_width(sprite_index);

draw_self();

// Draw cur text
draw_set_font(fntGame);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text_ext(bbox_left + 8, bbox_top + 8, visText, 16, sWidth - 16);
draw_set_font(fntDefault);
