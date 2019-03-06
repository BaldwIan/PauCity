// Only move if tablet is closed
if (!global.GUIUp)
{
	// Check if colliding with player
	var colPlayer = place_meeting(x, y, oPlayer);
	
	// Vector variables
	var vector2X = 0;
	var vector2Y = 1;
	
	// Get the input
	var interacting = gamepad_button_check(0, global.GPInteract) || keyboard_check(global.HKInteract);
	if ((colPlayer) && (interacting))
	{
		var xVelPlayer = oPlayer.velocity_[vector2X];
		velocity_[vector2X] = xVelPlayer;
		
		var yVelPlayer = oPlayer.velocity_[vector2Y];
		velocity_[vector2Y] = yVelPlayer;
	}
	
	// Clamp x velocity
	velocity_[vector2X] = clamp(velocity_[vector2X], -maxVelocity[vector2X], maxVelocity[vector2X]);

	// Friction
	if (!colPlayer)
	{
		fricPercent = 0.2;
		if (onGround) fricPercent = 0.7;
		velocity_[vector2X] = lerp(velocity_[vector2X], 0, fricPercent);
	}
	
	// Gravity
	velocity_[vector2Y] += gravity_;

	// Move and contact tiles
	move_and_contact_tiles(collision_tile_map_id, 64, velocity_);
	
}