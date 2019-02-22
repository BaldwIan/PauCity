/// @description Zoom In Camera
global.cwidth *= 0.9;
global.cheight *= 0.9;
global.cwidth = clamp(global.cwidth, 0.5*cwidth, cwidth);
global.cheight = clamp(global.cheight, 0.5*cheight, cheight);
