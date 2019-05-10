// If a cutscene is playing
if (global.ctsPos >= 0 && alarm[0] <= 0)
{
	
	// get anim data
	var anim = global.ctsAnims[global.ctsType, global.ctsPos];
	var actor = anim[0];
	var type  = anim[1];
	var data  = anim[2];
	
	// Set action time
	alarm[0] = 1 + room_speed * data[array_length_1d(data) - 1];	// Add one to fix not starting bug
	
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
		
	case cts_actions.stop:
		actor.velocity_[0] = 0;
		actor.velocity_[1] = 0;
		break;
		
	case cts_actions.xScale:
		// Get new xScale
		var newXS = data[0];
		actor.image_xscale = newXS;
		break;
		
	case cts_actions.yScale:
		// Get new yScale
		var newYS = data[0];
		actor.image_yscale = newYS;
		break;
		
	case cts_actions.cam_change_mode:
		// Get data for cam
		var newMode = data[0];
		oCamera.mode = newMode;
		break;
		
	case cts_actions.cam_change_follow:
		// Get data for new follow object
		var newFollow = data[0];
		oCamera.following = newFollow;
		break;
		
	case cts_actions.cam_change_offset:
		// Get new xoff and yoff
		var newX = data[0];
		var newY = data[1];
		
		oCamera.xOffset = newX;
		oCamera.yOffset = newY;
		break;
		
	case cts_actions.cam_change_zoom:
		// Get new width and height
		var newW = data[0];
		var newH = data[1];
		
		oCamera.wTo = newW;
		oCamera.hTo = newH;
		
		break;
		
	case cts_actions.cam_change_pos:
		// Get new pos
		var newXTo = data[0];
		var newYTo = data[1];
		
		oCamera.xTo = newXTo;
		oCamera.yTo = newYTo;
		break;
		
	case cts_actions.create:
		var xPos = data[0];
		var yPos = data[1];
		var lay = data[2];
		
		instance_create_layer(xPos, yPos, lay, actor);
		break;
		
	case cts_actions.destroy:
		// Destroy target object
		instance_destroy(actor);
		break;
		
	case cts_actions.dialogue:
		// Get pos and text info for dialogue
		var tX = data[0];
		var tY = data[1];
		var newT = data[2];
		var dialogue = instance_create_layer(tX, tY, "Effect", oTextBox);
		with (dialogue) text = newT;
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
