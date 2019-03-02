draw_self();
// Set for text horiz allignment
draw_set_halign(fa_middle);
draw_text(x + sprite_get_width(sprite_index)/2, y + sprite_get_height(sprite_index)/2, text);
draw_set_halign(fa_left);
