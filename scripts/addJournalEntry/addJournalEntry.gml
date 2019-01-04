/// @param0 Journal_Title
/// @param1 Journal_Content
/// @param2 Journal_Date
/// @param3 Journal_Author

var title   = argument0;
var content = argument1;
var date    = argument2;
var author  = argument3;

// Change height of grid
ds_grid_resize(journal, journalWidth, ds_grid_height(journal) + 1);

// Add characteristics of new entry
var newSpot = ds_grid_height(journal) - 1;
ds_grid_set(journal, 0, newSpot, title);
ds_grid_set(journal, 1, newSpot, content);
ds_grid_set(journal, 2, newSpot, date);
ds_grid_set(journal, 3, newSpot, author);


