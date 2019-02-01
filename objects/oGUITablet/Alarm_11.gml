/// @description Change Journal Entries (TMP)
if (journalSelected+1 >= ds_grid_height(global.journal))
{
	journalSelected = 0;
} else
{
	journalSelected++;
}

alarm[11] = room_speed * 2;