// Draw base sprite
draw_self();

switch (mode)
{
case (tabletMode.journal):
	// Get journal data
	var titleSelected = ds_grid_get(global.journal, journal.title, journalSelected);
	var contentSelected = ds_grid_get(global.journal, journal.content, journalSelected);
	var dateSelected = ds_grid_get(global.journal, journal.date, journalSelected);
	var authorSelected = ds_grid_get(global.journal, journal.author, journalSelected);

	// Draw Title-Date text
	draw_sprite(sJournalTitleDate, 0, bbox_left-1 + lBorder, bbox_top + tBorder);
	draw_text_ext(bbox_left + lBorder + sprite_get_width(sJournalTitleDate)/2, bbox_top + tBorder + 16, titleSelected + " - " + dateSelected, 16, sprite_get_width(sJournalTitleDate) - spacing);

	// Draw content text
	draw_sprite(sJournalContent, 0, bbox_left+1 + lBorder, bbox_top + tBorder + sprite_get_height(sJournalTitleDate) + spacing);
	draw_text_ext(bbox_left + lBorder + sprite_get_width(sJournalContent)/2, bbox_top + tBorder + sprite_get_height(sJournalTitleDate) + spacing, contentSelected, 32, sprite_get_width(sJournalContent) - spacing);

	// Draw Title text
	draw_sprite(sJournalTitle, 0, bbox_right+1 - sprite_get_width(sJournalTitle) - rBorder - spacing, bbox_bottom+1 - bBorder - sprite_get_height(sJournalTitle));
	draw_text_ext(bbox_right+1 - sprite_get_width(sJournalTitle)/2 - rBorder - spacing, bbox_bottom+1 - bBorder - sprite_get_height(sJournalTitle)/2 - spacing, titleSelected, 16, sprite_get_width(sJournalTitle) - spacing);

default:
	break;
}