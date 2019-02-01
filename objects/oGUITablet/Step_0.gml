/// @description Move to position
if (mode == tabletMode.closed)
{
	y = lerp(y, display_get_gui_height()+10, 0.25);
} else
{
	y = lerp(y, display_get_gui_height()/2 - sprite_get_height(sprite_index)/2, 0.15);
}

if (keyboard_check_pressed(global.tabletHotkey))
{
	switch (mode)
	{
	case (tabletMode.closed):
		mode = tabletMode.journal;
		break;
		
	default:
		mode = tabletMode.closed;
		break;
	}
}
