// Movement
var vector2X = 0;
var vector2Y = 1;

onGround = tile_collide_at_points(collision_tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);
onGround = onGround || place_meeting(x, bbox_bottom, oSolid);


// Anim updating
if (onGround)
{
	if (image_xscale == 0) image_xscale = 1;
	if (abs(velocity_[0]) < 0.3 || global.GUIUp) sprite_index = sprIdle;
	else sprite_index = sprWalk;
	
} else
{
	if (velocity_[1] > 0) sprite_index = sprFall;
	else if (velocity_[1] < 0) sprite_index = sprJump;
}

var newXScale = sign(velocity_[0]);
if (newXScale == 0) newXScale = image_xscale;
image_xscale = newXScale;

// Movement

// Friction
if (xInput == 0)
{
	fricPercent = 0.2;
	if (onGround) fricPercent = 0.7;
	velocity_[vector2X] = lerp(velocity_[vector2X], 0, fricPercent);
}

// Gravity
velocity_[vector2Y] += gravity_;

// Clamp velocity
velocity_[vector2X] = clamp(velocity_[vector2X] + xInput, -maxVelocity[vector2X], maxVelocity[vector2X]);
velocity_[vector2Y] = clamp(velocity_[vector2Y], -maxVelocity[vector2Y], maxVelocity[vector2Y]);

// Move and contact objects
move_and_contact_objects();										// Must have velocity_ array
	
// Move and contact tiles
move_and_contact_tiles(collision_tile_map_id, 64, velocity_);	// Must have velocity_ array
