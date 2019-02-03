mode = tabletMode.closed;

#region general


#region position

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

#endregion position

#region buttons

journalSwitch = instance_create_layer(bbox_right - sprite_get_width(sGUIJournalButton) - rBorder - spacing, bbox_top -  sprite_get_height(sGUIJournalButton), "GUI", oJournalButton);
with (journalSwitch) text = "Journal";

#endregion buttons


#endregion general

#region journal

// Journal Vars
journalSelected = 0;
scrolledAmount = 0;

#endregion journal

#region puzzle

// Puzzle vars


#endregion puzzle

#region TESTING-ONLY

// TEST ONLY - CHANGE JOURNAL ENTRIES
alarm[11] = room_speed * 2;

#endregion TESTING-ONLY