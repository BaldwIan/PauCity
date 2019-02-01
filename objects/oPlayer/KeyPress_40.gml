/// @description TEMPORARY FOR CAMERA
if (oCamera.mode == cammode.shake_follow)
{
	oCamera.mode = cammode.follow_object;
	oCamera.rotation = 0;
	show_debug_message("FOLLOW MODE");
} else
{
	oCamera.mode = cammode.shake_follow;
	show_debug_message("SHAKE MODE");
}
