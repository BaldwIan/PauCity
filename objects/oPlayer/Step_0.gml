onGround = tile_collide_at_points(collision_tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);
onGround = onGround || place_meeting(x, bbox_bottom, oSolid);

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

	// Friction
	if (xInput == 0)
	{
		fricPercent = 0.2;
		if (onGround) fricPercent = 0.7;
		velocity_[vector2X] = lerp(velocity_[vector2X], 0, fricPercent);
	}
	
	// Gravity
	velocity_[vector2Y] += gravity_;

	// Jumping
	if (onGround)
	{
		// Jumping
		if (gamepad_button_check_pressed(0, gpUp) || keyboard_check_pressed(kUp))
		{
			audio_sound_pitch(sndJump, random_range(2, 2.2));
			audio_play_sound(sndJump, 0.5, false);
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
	
	// Clamp velocity
	velocity_[vector2X] = clamp(velocity_[vector2X] + xInput, -maxVelocity[vector2X], maxVelocity[vector2X]);
	velocity_[vector2Y] = clamp(velocity_[vector2Y], -maxVelocity[vector2Y], maxVelocity[vector2Y]);
	
	// Move and contact objects
	move_and_contact_objects();										// Must have velocity_ array
	
	// Move and contact tiles
	move_and_contact_tiles(collision_tile_map_id, 64, velocity_);	// Must have velocity_ array
}


