// Only move if tablet is closed
if (!global.GUIUp)
{
	// Check if colliding with player
	var pushDistance = 20;
	var pushable = distance_to_object(oPlayer) < pushDistance;	// FIX LATER
	
	// Vector variables
	var vector2X = 0;
	var vector2Y = 1;
	
	// Friction
	fricPercent = 0.2;
	if (onGround) fricPercent = 0.7;
	
	// Get the input
	var interacting = gamepad_button_check(0, global.GPInteract) || keyboard_check(global.HKInteract);
	if (interacting)
	{
		if (pushable)
		{
			var xVelPlayer = oPlayer.velocity_[vector2X];
			velocity_[vector2X] = xVelPlayer;
		
			velocity_[vector2Y] = oPlayer.velocity_[vector2Y];
			image_index = 1;
			velocity_[vector2Y] += gravity_;
		}
		if !(y > oPlayer.y) velocity_[vector2Y] += gravity_;
	} else
	{
		image_index = 0;
		velocity_[vector2X] = lerp(velocity_[vector2X], 0, fricPercent);	// Apply friction
		velocity_[vector2Y] += gravity_;
	}
	
	
	
	
	// Clamp x velocity
	velocity_[vector2X] = clamp(velocity_[vector2X], -maxVelocity[vector2X], maxVelocity[vector2X]);

	// Move and contact objects
	move_and_contact_objects();
	// Move and contact tiles
	move_and_contact_tiles(collision_tile_map_id, 64, velocity_);
	
}