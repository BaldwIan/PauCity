// resize GUI to window size
display_set_gui_size(display_get_width(), display_get_height());

// Set draw allignment
//draw_set_valign(fa_top);
draw_set_halign(fa_center);

// Set font
draw_set_font(fntDefault);

#region globals

// Journal
global.journalWidth = 4;
global.journal = ds_grid_create(global.journalWidth, 0);
enum journal
{
	title,
	content,
	date,
	author,
}

#endregion globals



addJournalEntry("Journal Test", "Content Test inside the journal 111111 111111111111 11111 111111111 1111111111 11111111111 111111111111 1111111 11111 111111111111 111111 111111 111111 1111111111 111111111 1111111", "01/02/2019", "Ian B");
addJournalEntry("Journal Test1", "Content Test inside the journal1", "01/03/2019", "Ian B");
addJournalEntry("Journal Test2", "Content Test inside the journal2", "01/03/2019", "Ian B");
addJournalEntry("Journal Test3", "Content Test inside the journal3", "01/03/2019", "Ian B");
addJournalEntry("Journal Test4", "Content Test inside the journal4", "01/03/2019", "Ian B");
addJournalEntry("Journal Test5", "Content Test inside the journal5", "01/03/2019", "Ian B");
addJournalEntry("Journal Test6", "Content Test inside the journal6", "01/03/2019", "Ian B");
addJournalEntry("Journal Test7", "Content Test inside the journal7", "01/03/2019", "Ian B");
addJournalEntry("Journal Test8", "Content Test inside the journal8", "01/03/2019", "Ian B");
addJournalEntry("Journal Test9", "Content Test inside the journal9", "01/03/2019", "Ian B");
addJournalEntry("Journal Test10", "Content Test inside the journal10", "01/03/2019", "Ian B");
addJournalEntry("Journal Test11", "Content Test inside the journal11", "01/03/2019", "Ian B");
addJournalEntry("Journal Test12", "Content Test inside the journal12", "01/03/2019", "Ian B");
addJournalEntry("Journal Test13", "Content Test inside the journal13", "01/03/2019", "Ian B");
