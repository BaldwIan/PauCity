var vector2X = 0;
var vector2Y = 1;

//collision horizontal
if (place_meeting(x + velocity_[vector2X], y, oSolid))
{
	// Not yet colliding
	if (!place_meeting(x + sign(velocity_[vector2X]), y, oSolid))
	{
		x += sign(velocity_[vector2X]);	// Increments of 1
	}
	velocity_[vector2X] = 0;			// After done incrementing
}

// vertical collision
if (place_meeting(x, y + velocity_[vector2Y], oSolid))
{
	// Not yet colliding
	if (!place_meeting(x, y + sign(velocity_[vector2Y]), oSolid))
	{
		y += sign(velocity_[vector2Y]);	// Increments of 1
	}
	velocity_[vector2Y] = 0;			// After done incrementing
}
