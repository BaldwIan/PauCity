mode = cammode.follow_object;

camera = camera_create();
//cwidth = global.cwidth;   // Initial used to clamp for zooming
//cheight = global.cheight; // Initial used to clamp for zooming

BG = [sBGInd1_1, sBGInd1_2, sBGInd1_3, sBGInd1_4];//[sBGDefault];

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(global.cwidth, global.cheight, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

rotation = 0;

following = oPlayer;
xTo = x;
yTo = y;

mouseXPrev = -1;
mouseYPrev = -1;
