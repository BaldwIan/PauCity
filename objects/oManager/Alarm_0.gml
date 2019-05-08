/// @description Change cutscene action

// get anim data
var anim = global.ctsAnims[global.ctsType, global.ctsPos];
var actor = anim[0];
var type  = anim[1];
var data  = anim[2];

switch (type)
{
case cts_actions.move:
	actor.xInput = 0;
	break;
	
case cts_actions.jump:
	actor.velocity_[1] = -actor.jumpSpd;
	break;
	
default:
	break;
}

global.ctsPos++;
if (global.ctsPos >= array_length_2d(global.ctsAnims, global.ctsType))
{
	global.ctsPos = -1;
	global.ctsType = -1;
}
