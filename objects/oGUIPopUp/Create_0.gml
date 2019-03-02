x = global.cwidth - sprite_get_width(sprite_index)/2;
y = global.cheight*2 + sprite_get_height(sprite_index);

targetY = global.cheight*2 - sprite_get_height(sprite_index) - 8;
initTargetY = targetY;
alarm[0] = room_speed*3;
alarm[1] = room_speed*1.5;

// Which event to draw
mode = popup_actions.puzzle;


// Sprite
modeText = "";
switch (mode)
{
case (popup_actions.mystery):
	modeText = "?!";
	modeSprite = sPopUpMystery;
	break;
	
case (popup_actions.journal):
	modeText = "New Journal Entry Downloaded!";
	modeSprite = sPopUpJournal;
	break;
	
case (popup_actions.puzzle):
	modeText = "New Puzzle Downloaded!";
	modeSprite = sPopUpPuzzle;
	break;
	
default:
	break;
}
