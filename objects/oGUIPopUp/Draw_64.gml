draw_self();

var modeSprite = sPopUpMystery;
var modeText = "";
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

draw_sprite(modeSprite, 0, bbox_left, bbox_top);
draw_text(bbox_left + sprite_get_width(sPopUpDefault), y + sprite_get_height(sprite_index)/2, modeText);
