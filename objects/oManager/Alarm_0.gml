/// @description Change cutscene action

// get anim data
var anim = global.ctsAnims[global.ctsType, global.ctsPos];
var actor = anim[0];
var type  = anim[1];
//var data  = anim[2];	// Unused as of now

switch (type)
{
case cts_actions.move:
	actor.xInput = 0;
	break;
	
default:
	break;
}

global.ctsPos++;
