enum tabletMode
{
	journal,
	puzzle,
	closed,
}

mode = tabletMode.closed;

// Position Vars
// Measurements on sprite
lBorder = 32;
rBorder = 32;
tBorder = 32;
bBorder = 32;
spacing = 16;

// Set position
x = display_get_gui_width()/2 - sprite_get_width(sprite_index)/2;
y = display_get_gui_height();

#region journal

// Journal Vars
journalSelected = 0;
scrolledAmount = 0;

#endregion journal

#region console

// Tablet vars


#endregion console

#region TESTING-ONLY

// TEST ONLY - CHANGE JOURNAL ENTRIES
alarm[11] = room_speed * 2;

#endregion TESTING-ONLY
