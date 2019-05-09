// Draw mode - reset at end of draw
draw_set_font(fntGUI);

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
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// Draw content sprite
	var contSX = bbox_left+1 + lBorder;
	var contSY = bbox_top + tBorder + TitleDateH + spacing;
	draw_sprite(sJournalContent, 0, contSX, contSY);
	// Draw content text
	var contTX = bbox_left + lBorder + spacing;
	var contTY = bbox_top + tBorder + TitleDateH + spacing + spacing;
	draw_text_ext(contTX, contTY, contentSelected, 32, ContentW - spacing);
	
	// Draw Title-Date sprite
	var TitleDateSX = bbox_left-1 + lBorder;
	var TitleDateSY = bbox_top + tBorder;
	draw_sprite(sJournalTitleDate, 0, TitleDateSX, TitleDateSY);
	// Draw Title-Date text
	var TitleDateTX = bbox_left + lBorder + spacing;
	var TitleDateTY = bbox_top + tBorder + 16;
	draw_text_ext(TitleDateTX, TitleDateTY, titleSelected + " - " + dateSelected, 16, TitleDateW - spacing);

	// Draw Title sprite
	var TitleSX = bbox_right+1 - TitleW - rBorder - spacing;
	var TitleSY = bbox_bottom+1 - bBorder - TitleH;
	draw_sprite(sJournalTitle, 0, TitleSX, TitleSY);
	// Draw Title text
	var TitleTX = bbox_right+1 - TitleW - rBorder - spacing + spacing;
	var TitleTY = bbox_bottom+1 - bBorder - TitleH/2 - spacing;
	draw_text_ext(TitleTX, TitleTY, titleSelected, 16, TitleW - spacing);

	// Draw Journal Entries
	for (i = 0; i < min(JShownEntries, JDSHeight - (JScrolledAmount%JShownEntries)); i++)
	{
		var entryDate = ds_grid_get(global.journal, journal.date, i+JScrolledAmount);
		var entryX = x + lBorder + ContentW + spacing;
		var entryY = y + tBorder + TitleH + (i * EntryH) + spacing * (i + 1);
		var entryTextX = entryX + spacing;
		var entryTextY = entryY + spacing;
		var entrySpriteIndex = 0;
		if (JSelected == i + JScrolledAmount) entrySpriteIndex = 1;
		draw_sprite(sJournalEntry, entrySpriteIndex, entryX, entryY);
		draw_text(entryTextX, entryTextY, entryDate);
	}
	
	// Reset horiz text allignment
	draw_set_halign(fa_left);
	break;
	
case (tablet_mode.puzzle):
	// Draw puzzle text
	draw_text(bbox_left + 32, bbox_top + 64, global.PHint);
	draw_text(bbox_left + 32, bbox_top + 128, global.PText);
	
	// Draw puzzle keyboard
	for (var alphYY = 0; alphYY < 3; alphYY++)
	{
		var alphLen = array_length_1d(alphabet)
		for (var alphXX = 0; alphXX < 10; alphXX++)
		{
			// Current pos in alphabet
			var alphCurPos = clamp(((alphYY - 1) * (alphLen/3) + alphXX + 10), 0, alphLen - 1);
			
			// Set letter box sprite to selected
			var alphSInd = 0;
			if (alphCurPos == alphPos) alphSInd = 1;
			
			// Letter pos
			var lettX = bbox_left + 32 + (70 * alphXX);
			var lettY = bbox_top + 200 + (alphYY * 86);
			
			// Draw letter box and letter
			draw_sprite(sLetterBox, alphSInd, lettX, lettY);
			draw_set_valign(fa_top);
			draw_text(lettX, lettY, alphabet[alphCurPos]);
			draw_set_valign(fa_center);
		}
	}
	
	break;
	
default:
	// Draw notification sprite shaking
	if (global.tabletNotification)
	{
		draw_sprite(sTNotification, 0, display_get_gui_width() - 150 + irandom_range(-16, 16), display_get_gui_height() - 150 + irandom_range(-9, 9));
	}
	break;
}

// Reset font
draw_set_font(fntDefault);
