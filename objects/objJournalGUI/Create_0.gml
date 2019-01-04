/// @description Setting up vars for journal GUI

visible = false;

// Set position
x = view_wport[0]/2 - sprite_get_width(sprite_index)/2;
y = view_hport[0]/2 - sprite_get_height(sprite_index)/2;

// Measurements on sprite
lBorder = 16;
rBorder = 16;
tBorder = 16;
bBorder = 16;

spacing = 8;

// Selection data
journalSelected = 0;
scrolledAmount = 0;
