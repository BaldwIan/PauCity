x = global.cwidth - sprite_get_width(sprite_index)/2;
y = global.cheight*2 + sprite_get_height(sprite_index);

targetY = global.cheight*2 - sprite_get_height(sprite_index) - 8;
initTargetY = targetY;
alarm[1] = room_speed*1.5;
