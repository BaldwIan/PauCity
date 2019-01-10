/// @description Draw journl parts

// Get journal data
var titleSelected = ds_grid_get(global.journal, journal.title, journalSelected);
var contentSelected = ds_grid_get(global.journal, journal.content, journalSelected);
var dateSelected = ds_grid_get(global.journal, journal.date, journalSelected);
var authorSelected = ds_grid_get(global.journal, journal.author, journalSelected);

// Draw base sprite
draw_self();

// Draw Title-Date text
draw_sprite(sprJournalTitleDate, 0, bbox_left-1 + lBorder, bbox_top + tBorder);
draw_text_ext(bbox_left + lBorder + sprite_get_width(sprJournalTitleDate)/2, bbox_top + tBorder + 16, titleSelected + " - " + dateSelected, 16, sprite_get_width(sprJournalTitleDate) - spacing);

// Draw content text
draw_sprite(sprJournalContent, 0, bbox_left+1 + lBorder, bbox_top + tBorder + sprite_get_height(sprJournalTitleDate) + spacing);
draw_text_ext(bbox_left + lBorder + sprite_get_width(sprJournalContent)/2, bbox_top*8 + tBorder + sprite_get_height(sprJournalTitleDate) + spacing, contentSelected, 32, sprite_get_width(sprJournalContent) - spacing);

// Draw Title text
draw_sprite(sprJournalTitle, 0, bbox_right+1 - sprite_get_width(sprJournalTitle) - rBorder - spacing, bbox_bottom+1 - bBorder - sprite_get_height(sprJournalTitle));
draw_text_ext(bbox_right+1 - sprite_get_width(sprJournalTitle)/2 - rBorder - spacing, bbox_bottom+1 - bBorder - sprite_get_height(sprJournalTitle)/2 - spacing, titleSelected, 16, sprite_get_width(sprJournalTitle) - spacing);


