draw_self();

var modeSprite = sPopUpMystery;
switch (mode)
{
case (popup_actions.mystery):
	modeSprite = sPopUpMystery;
	break;
	
case (popup_actions.journal):
	modeSprite = sPopUpJournal;
	break;
	
case (popup_actions.puzzle):
	modeSprite = sPopUpPuzzle;
	break;
	
default:
	break;
}

draw_sprite(modeSprite, 0, bbox_left, bbox_top);
