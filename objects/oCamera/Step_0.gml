var smoothPan = true;
var smoothZoom = true;

switch (mode)
{
	case cammode.follow_object:
		// Check if object to follow exists
		if (!instance_exists(following)) break;
		
		
		xTo = following.x + xOffset;
		yTo = following.y + yOffset;
		break;
		
	case cammode.follow_mouse_drag:
		smoothPan = false;
		var mx = display_mouse_get_x();
		var my = display_mouse_get_y();
	
		if (mouse_check_button(mb_left))
		{
			xTo += (mouseXPrev - mx) / window_get_width() * global.cwidth;
			yTo += (mouseYPrev - my) / window_get_height() * global.cheight;
		}
		
		mouseXPrev = mx;
		mouseYPrev = my;
		
		break;
		
	case cammode.follow_mouse_border:
		var borderX = global.cwidth/3;
		var borderY = global.cheight/3;
		if (!point_in_rectangle(mouse_x, mouse_y, x - borderX, y - borderY, x + borderX, y + borderY))
		{
			xTo = lerp(xTo, mouse_x, 0.05);
			yTo = lerp(yTo, mouse_y, 0.05);
		}
		break;
		
	case cammode.follow_mouse_peak:
		if (!instance_exists(following)) break;
		xTo = lerp(following.x, mouse_x, 0.5);
		yTo = lerp(following.y, mouse_y, 0.5);
		break;
		
	case cammode.move_to_target:
		if (mouse_check_button(mb_left))
		{
			xTo = mouse_x;
			yTo = mouse_y;
		}
		break;
		
	// Buggy
	case cammode.shake:
		rotation = random_range(-4, 4);
		break;
		
	// Buggy
	case cammode.shake_follow:
		//if (!instance_exists(following)) break;
		//rotation += random_range(-0.3, 0.3);
		xTo = following.x;
		yTo = following.y;
		
	default:
		break;
}
/*
// Fix offscreen bug
if (xTo + xOffset < global.cwidth / 2) xTo = global.cwidth / 2;
else if (xTo + xOffset < room_width - global.cwidth / 2) xTo = room_width - global.cwidth / 2;
if (yTo + yOffset < global.cheight / 2) yTo = global.cheight / 2;
else if (yTo + yOffset < room_height - global.cheight / 2) yTo = room_height - global.cheight / 2;
*/
// Lerp to pos
if (smoothPan)
{
	if (x + (xTo - x) / 15 > global.cwidth / 2) and (x + (xTo - x) / 15 < room_width - global.cwidth / 2) x += (xTo - x) / 5;
	if (y + (yTo - y) / 15 > global.cheight / 2) and (y + (yTo - y) / 15 < room_height - global.cheight / 2) y += (yTo - y) / 5;
} else	// instantly at new pos
{
	x = xTo;
	y = yTo;
}

if (smoothZoom)
{
	global.cwidth = lerp(global.cwidth, wTo, 0.1);
	global.cheight = lerp(global.cheight, hTo, 0.1);
} else
{
	global.cwidth = wTo;
	global.cheight = hTo;
}

// Set view again
var vm = matrix_build_lookat(x, y, -10, x, y, 0, rotation, 1, 0);
var pm = matrix_build_projection_ortho(global.cwidth, global.cheight, 1, 10000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);


// Camera won't go outside room
x = clamp(x, 0 + global.cwidth / 2, room_width - global.cwidth / 2);
y = clamp(y, 0 + global.cheight / 2, room_height - global.cheight / 2);
