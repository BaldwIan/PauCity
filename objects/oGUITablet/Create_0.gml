mode = tablet_mode.closed;
lastMode = tablet_mode.journal; // Used when journal is reopened
curPIndex = 0;

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

var bWidth = sprite_get_width(sGUITabletButton);
var bHeight = sprite_get_height(sGUITabletButton);
buttonJournal = instance_create_layer(bbox_right - bWidth - spacing, bbox_top - bHeight, "GUI", oTabletButton);
buttonPuzzle = instance_create_layer(bbox_right - bWidth*2 - spacing, bbox_top - bHeight, "GUI", oTabletButton);
with (buttonJournal) action = button_actions.Tjournal_switch;
with (buttonPuzzle) action = button_actions.Tpuzzle_switch;

#endregion buttons

#endregion general

#region journal

// Journal Vars
JSelected = 0;
JScrolledAmount = 0;
JShownEntries = 5;

#endregion journal

#region puzzle

// Puzzle vars
alphabet = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P",
			"A", "S", "D", "F", "G", "H", "J", "K", "L", "#",
			"Z", "X", "C", "V", "B", "N", "M", "<", ">", "?"];


// Position in alphabet list			
alphPos = 0;

#endregion puzzle
