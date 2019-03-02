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

	//Set text allignment for content
	draw_set_halign(fa_center);
	
	// Draw content sprite
	var contSX = bbox_left+1 + lBorder;
	var contSY = bbox_top + tBorder + TitleDateH + spacing;
	draw_sprite(sJournalContent, 0, contSX, contSY);
	// Draw content text
	var contTX = bbox_left + lBorder + ContentW/2;
	var contTY = bbox_top + tBorder + TitleDateH + spacing + ContentH/4;
	draw_text_ext(contTX, contTY, contentSelected, 32, ContentW - spacing);
	
	// Draw Title-Date sprite
	var TitleDateSX = bbox_left-1 + lBorder;
	var TitleDateSY = bbox_top + tBorder;
	draw_sprite(sJournalTitleDate, 0, TitleDateSX, TitleDateSY);
	// Draw Title-Date text
	var TitleDateTX = bbox_left + lBorder + TitleDateW/2;
	var TitleDateTY = bbox_top + tBorder + 16;
	draw_text_ext(TitleDateTX, TitleDateTY, titleSelected + " - " + dateSelected, 16, TitleDateW - spacing);

	// Draw Title sprite
	var TitleSX = bbox_right+1 - TitleW - rBorder - spacing;
	var TitleSY = bbox_bottom+1 - bBorder - TitleH;
	draw_sprite(sJournalTitle, 0, TitleSX, TitleSY);
	// Draw Title text
	var TitleTX = bbox_right+1 - TitleW/2 - rBorder - spacing;
	var TitleTY = bbox_bottom+1 - bBorder - TitleH/2 - spacing;
	draw_text_ext(TitleTX, TitleTY, titleSelected, 16, TitleW - spacing);

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
	
	// Reset horiz text allignment
	draw_set_halign(fa_left);
	
default:
	break;
}
