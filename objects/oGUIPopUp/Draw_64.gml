draw_self();

draw_sprite(modeSprite, 0, bbox_left, bbox_top);
draw_text(bbox_left + sprite_get_width(sPopUpDefault), y + sprite_get_height(sprite_index)/2, modeText);
