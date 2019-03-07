// Only move if tablet is closed
if (!global.GUIUp)
{
	// Check if colliding with player
	var pushDistance = 10;
	var pushable = distance_to_object(oPlayer)<pushDistance && y == oPlayer.y;
	
	// Vector variables
	var vector2X = 0;
	var vector2Y = 1;
	
	// Get the input
	var interacting = gamepad_button_check(0, global.GPInteract) || keyboard_check(global.HKInteract);
	if (pushable)
	{
		if (interacting)
		{
			var xVelPlayer = oPlayer.velocity_[vector2X];
			velocity_[vector2X] = xVelPlayer;
		
			var yVelPlayer = oPlayer.velocity_[vector2Y];
			velocity_[vector2Y] = yVelPlayer;
		}
	} else // Friction
	{
		fricPercent = 0.2;
		if (onGround) fricPercent = 0.7;
		velocity_[vector2X] = lerp(velocity_[vector2X], 0, fricPercent);
	}
	
	// Clamp x velocity
	velocity_[vector2X] = clamp(velocity_[vector2X], -maxVelocity[vector2X], maxVelocity[vector2X]);

	
	// Gravity
	velocity_[vector2Y] += gravity_;

	// Move and contact tiles
	move_and_contact_tiles(collision_tile_map_id, 64, velocity_);
	
}