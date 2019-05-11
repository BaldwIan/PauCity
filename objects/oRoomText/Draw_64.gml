var c = c_white;
draw_set_font(fntBig);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_text_color(display_get_gui_width()/2, display_get_gui_height()/2, text, c, c, c, c, alpha);
draw_set_font(fntDefault);
alpha -= 0.005;