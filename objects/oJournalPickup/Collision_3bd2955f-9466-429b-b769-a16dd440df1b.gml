/// @description Add a journal entry and destroy object

instance_destroy(id);
add_journal_entry(title, "This journal was picked up at: " + string(current_time), string(current_time), author);
// add_journal_entry(title, content, date, author);
