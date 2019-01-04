/// @description Draw journl parts

// Get journal data
var titleSelected = ds_grid_get(global.journal, journal.title, journalSelected);
var dateSelected = ds_grid_get(global.journal, journal.date, journalSelected);

// Draw base sprite
draw_self();

// Draw Title-Date Text
draw_sprite(sprJournalTitleDate, 0, bbox_left + lBorder, bbox_top + tBorder);
draw_text_ext(bbox_left + lBorder + sprite_get_width(sprJournalTitleDate)/2, bbox_top + tBorder + 16, titleSelected + " - " + dateSelected, 16, sprite_get_width(sprJournalTitleDate) - spacing);
