enum cammode
{
	follow_object,
	follow_mouse_drag,
	follow_mouse_border,
	follow_mouse_peak,
	move_to_target,
	shake,
	shake_follow,
}

mode = cammode.follow_object;

camera = camera_create();
cwidth = 960;
cheight = 540;

BG = [sBGDefault, sBGDefault1, sBGDefault2];//[sBGDefault];

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

// Shader Stuff
shTranslate = shader_get_uniform(shXWave, "translate");
translateAmount = 0.0;
translateAdd = 0.04;
