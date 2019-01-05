/// @description Create/Destroy Button
visible = !visible;
if (instance_exists(exitButton))
{
	instance_destroy(exitButton);
} else
{
	exitButton = instance_create_layer(bbox_right+1 - rBorder - sprite_get_width(sprJournalButton) - spacing, bbox_top + tBorder, "GUI", objGUIButton);
	with (exitButton) 
	{
		action = buttonActions.closeJournal;
		sprite_index = sprJournalButton;
	}
}
