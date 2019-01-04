globalvar journal, journalWidth;
journalWidth = 4;
journal = ds_grid_create(journalWidth, 0);

addJournalEntry("Journal Test", "Content Test inside the journal", "01/02/2019", "Ian B");
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


#region testing

// For testing only
for (var yy = 0; yy < ds_grid_height(journal); yy++)
{
	show_debug_message("\n");
	for (var xx = 0; xx < ds_grid_width(journal); xx++)
	{
		show_debug_message("Journal Entry: " + string(ds_grid_get(journal, xx, yy)));
	}
	show_debug_message("\n");
}
#endregion testing
