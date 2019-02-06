/// @description Movement logic

// Movement keys
var kUp = global.HKUp;
var vMove = gamepad_axis_value(0, gp_axislh);
var kRight = global.HKRight;

// Get the input
if (vMove < 0.1 && vMove > -0.1) vMove = 0;
var xInput = vMove * acceleration; //(keyboard_check(kRight) - keyboard_check(kLeft)) * acceleration;

// Vector variables
var vector2X = 0;
var vector2Y = 1;

// Horizontal movement
velocity_[vector2X] = clamp(velocity_[vector2X] + xInput, -maxVelocity[vector2X], maxVelocity[vector2X]);

// Friction
if (xInput == 0)
{
	velocity_[vector2X] = lerp(velocity_[vector2X], 0, .2);
}

// Gravity
velocity_[vector2Y] += gravity_;

// Move and contact tiles
move_and_contact_tiles(collision_tile_map_id, 64, velocity_);

// Jumping
var onGround = tile_collide_at_points(collision_tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);
if (onGround)
{
	// Jumping
	if (gamepad_button_check(0, kUp))
	{
		velocity_[vector2Y] = -jumpSpd;
	}
} else
{
	// Control jump height
	if (gamepad_button_check_released(0, kUp) && velocity_[vector2Y] <= -(jumpSpd/3))
	{
		velocity_[vector2Y] = -(jumpSpd/3);
	}
}
