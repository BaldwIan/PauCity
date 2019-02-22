/// @description Zoom Out Camera
global.cwidth *= 1.1;
global.cheight *= 1.1
global.cwidth = clamp(global.cwidth, 0.5*cwidth, cwidth);
global.cheight = clamp(global.cheight, 0.5*cheight, cheight);;