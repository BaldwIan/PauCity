// If a cutscene is playing
if (global.ctsPos >= 0 && alarm[0] <= 0)
{
	
	// get anim data
	var anim = global.ctsAnims[global.ctsType, global.ctsPos];
	var actor = anim[0];
	var type  = anim[1];
	var data  = anim[2];
	
	// Set action time
	alarm[0] = room_speed * data[array_length_1d(data) - 1];
	
	// anim based on type
	switch (type)
	{
	case cts_actions.move:
		// Get data for move event
		var dir  = data[0];	// -1 if left, 1 if right
		actor.xInput = dir * actor.acceleration;
		break;
		
	case cts_actions.change_obj:
		// Get data for chenge obj event
		var newActor = data[0];
		instance_create_layer(actor.x, actor.y, "Dynamic", newActor);
		instance_destroy(actor);
		break;
		
	default:
		break;
		
	}
}

// Skip cutscene
if (keyboard_check_pressed(ord("F")))
{
	global.ctsType = -1;
	global.ctsPos = -1;
	room_goto_next();
}
