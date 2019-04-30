if (global.ctsPos >= 0)
{
	// get anim data
	var anim = global.ctsAnims[global.ctsType, global.ctsPos];
	var actor = anim[0];
	var type  = anim[1];
	var data  = anim[2];
	
	// Set action time
	alarm[0] = data[array_length_1d(data) - 1];
	
	// anim based on type
	switch (type)
	{
	case cts_actions.move:
		// Get data for move event
		var dir  = data[0];	// -1 if left, 1 if right
		actor.xInput = dir * actor.acceleration;
		break;
		
	default:
		break;
		
	}
}