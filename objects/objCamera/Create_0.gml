enum cammode
{
	follow_object,
	follow_mouse_drag,
	follow_mouse_border,
	follow_mouse_peak,
	move_to_target,
}

mode = cammode.follow_mouse_peak;

camera = camera_create();
cwidth = 960;
cheight = 540;

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(cwidth, cheight, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

following = objPlayer;
xTo = x;
yTo = y;
yTo = y;

mouseXPrev = -1;
mouseYPrev = -1;
