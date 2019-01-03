/// @description Movement logic

// Movement keys
var kUp = vk_space;
var kLeft = ord("A");
var kDown = ord("S");
var kRight = ord("D");

// Get the input
var xInput = (keyboard_check(kRight) - keyboard_check(kLeft)) * acceleration;

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
	if (keyboard_check_pressed(vk_space))
	{
		velocity_[vector2Y] = -jumpSpd;
	}
} else
{
	// Control jump height
	if (keyboard_check_released(vk_space) && velocity_[vector2Y] <= -(jumpSpd/3))
	{
		velocity_[vector2Y] = -(jumpSpd/3);
	}
}