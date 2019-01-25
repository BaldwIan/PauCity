/// @description TEMPORARY FOR CAMERA
if (oCamera.mode == cammode.shake_point)
{
	oCamera.mode = cammode.follow_object;
} else
{
	oCamera.mode = cammode.shake_point;
}
