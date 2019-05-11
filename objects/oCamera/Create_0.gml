mode = cammode.follow_object;	// Change to altar cam movement

camera = camera_create();

// Layered from 0 - n
BG = [sBGGround1, sBGInd1_1, sBGInd1_2, sBGInd1_3, sBlank64, sBlank64, sBlank64, sBlank64, sBlank64, sBlank64];

// Cam View Vars
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(global.cwidth, global.cheight, 1, 10000);

// Set view
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

// Use not recommended
rotation = 0;

// Follow info
following = oPlayer;
xTo = x;
yTo = y;

xOffset = 0;
yOffset = 0;

wTo = global.cwidth;	// width to lerp to
hTo = global.cheight;	// height to lerp to

// For mouse scrolling
mouseXPrev = -1;
mouseYPrev = -1;
