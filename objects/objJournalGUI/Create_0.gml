/// @description Setting up vars for journal GUI

visible = false;

// Set position
x = display_get_gui_width()/2 - sprite_get_width(sprite_index)/2;
y = display_get_gui_height()/2 - sprite_get_height(sprite_index)/2;

// Measurements on sprite
lBorder = 32;
rBorder = 32;
tBorder = 32;
bBorder = 32;

spacing = 16;

// Selection data
journalSelected = 0;
scrolledAmount = 0;
