onGround = tile_collide_at_points(collision_tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);

// Only move if tablet is closed
if (!global.GUIUp)
{
	// Movement keys
	var gpUp = global.GPJump;
	var kUp = global.HKJump;
	var gpVMove = gamepad_axis_value(0, gp_axislh);
	var kRight = global.HKRight;
	var kLeft = global.HKLeft;
	
	// Get the input
	if (gpVMove < 0.5 && gpVMove > -0.5) gpVMove = 0;
	var xInput;
	if (gpVMove != 0)
	{
		xInput = gpVMove * acceleration;
	} else
	{
		xInput = (keyboard_check(kRight) - keyboard_check(kLeft)) * acceleration;
	}

	// Vector variables
	var vector2X = 0;
	var vector2Y = 1;

	// Horizontal movement
	velocity_[vector2X] = clamp(velocity_[vector2X] + xInput, -maxVelocity[vector2X], maxVelocity[vector2X]);

	// Friction
	if (xInput == 0)
	{
		fricPercent = 0.2;
		if (onGround) fricPercent = 0.7;
		velocity_[vector2X] = lerp(velocity_[vector2X], 0, fricPercent);
	}
	
	// Gravity
	velocity_[vector2Y] += gravity_;

	// Move and contact tiles
	move_and_contact_tiles(collision_tile_map_id, 64, velocity_);
	
	// Jumping
	if (onGround)
	{
		// Jumping
		if (gamepad_button_check_pressed(0, gpUp) || keyboard_check_pressed(kUp))
		{
			velocity_[vector2Y] = -jumpSpd;
		}
	} else
	{
		// Control jump height
		if ((gamepad_button_check_released(0, gpUp) || keyboard_check_released(kUp)) && velocity_[vector2Y] <= -(jumpSpd/3))
		{
			velocity_[vector2Y] = -(jumpSpd/3);
		}
	}
}


