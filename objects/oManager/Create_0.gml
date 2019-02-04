// Set globals
declare_globals();

audio_play_sound(musMainIntro, 1, false);
alarm[0] = 1;

// resize GUI to window size
display_set_gui_size(display_get_width(), display_get_height());

// Set draw allignment
//draw_set_valign(fa_top);
draw_set_halign(fa_center);

// Set font
draw_set_font(fntDefault);

// JOURNAL TESTING
add_journal_entry("Journal Test", "Content Test inside the journal 111111 111111111111 11111 111111111 1111111111 11111111111 111111111111 1111111 11111 111111111111 111111 111111 111111 1111111111 111111111 1111111", "01/02/2019", "Ian B");
