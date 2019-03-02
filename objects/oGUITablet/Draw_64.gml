// Draw base sprite
draw_self();

switch (mode)
{
case (tablet_mode.journal):
	// Get journal data
	var titleSelected = ds_grid_get(global.journal, journal.title, JSelected);
	var contentSelected = ds_grid_get(global.journal, journal.content, JSelected);
	var dateSelected = ds_grid_get(global.journal, journal.date, JSelected);
	var authorSelected = ds_grid_get(global.journal, journal.author, JSelected);
	var JDSHeight = ds_grid_height(global.journal);
	
	// dimension vars
	var EntryW = sprite_get_width(sJournalEntry);
	var EntryH = sprite_get_height(sJournalEntry);
	
	var DateW = sprite_get_width(sJournalDate);
	var DateH = sprite_get_height(sJournalDate);
	
	var TitleDateW = sprite_get_width(sJournalTitleDate);
	var TitleDateH = sprite_get_height(sJournalTitleDate);
	
	var ContentW = sprite_get_width(sJournalContent);
	var ContentH = sprite_get_height(sJournalContent);
	
	var TitleW = sprite_get_width(sJournalTitle);
	var TitleH = sprite_get_height(sJournalTitle);

	// Draw Title-Date text
	draw_sprite(sJournalTitleDate, 0, bbox_left-1 + lBorder, bbox_top + tBorder);
	draw_text_ext(bbox_left + lBorder, bbox_top + tBorder + 16, titleSelected + " - " + dateSelected, 16, TitleDateW - spacing);

	// Draw content text
	draw_sprite(sJournalContent, 0, bbox_left+1 + lBorder, bbox_top + tBorder + TitleDateH + spacing);
	draw_text_ext(bbox_left + lBorder, bbox_top + tBorder + TitleDateH + spacing, contentSelected, 32, ContentW - spacing);

	// Draw Title text
	draw_sprite(sJournalTitle, 0, bbox_right+1 - TitleW - rBorder - spacing, bbox_bottom+1 - bBorder - TitleH);
	draw_text_ext(bbox_right+1 - TitleW/2 - rBorder - spacing, bbox_bottom+1 - bBorder - TitleH/2 - spacing, titleSelected, 16, TitleW - spacing);

	// Draw Journal Entries
	for (i = 0; i < min(JShownEntries, JDSHeight - (JScrolledAmount%JShownEntries)); i++)
	{
		var entryDate = ds_grid_get(global.journal, journal.date, i+JScrolledAmount);
		var entryX = x + lBorder + ContentW + spacing*2;
		var entryY = y + tBorder + TitleH + (i * EntryH) + spacing*(i+1);
		var entryTextX = entryX + EntryW/2;
		var entryTextY = entryY + EntryH/2;
		var entrySpriteIndex = 0;
		if (JSelected == i + JScrolledAmount) entrySpriteIndex = 1;
		draw_sprite(sJournalEntry, entrySpriteIndex, entryX, entryY);
		draw_text(entryTextX, entryTextY, entryDate);
	}
default:
	break;
}
