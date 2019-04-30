// Set globals
declare_globals();

audio_play_sound(musMainIntro, 1, false);	// Start main music

// resize GUI to window size
var scrWidth = display_get_width();
var scrHeight = display_get_height();
display_set_gui_size(scrWidth*(1/(scrWidth/1920)), scrHeight*(1/(scrHeight/1080)));

// Set draw allignment
draw_set_valign(fa_center);
draw_set_halign(fa_left);

// Set font
draw_set_font(fntDefault);

// JOURNAL TESTING
add_journal_entry("Journal Test", "Content Test inside the journal 111111 111111111111 11111 111111111 1111111111 11111111111 111111111111 1111111 11111 111111111111 111111 111111 111111 1111111111 111111111 1111111", "01/02/2019", "Ian B");

cutscene_start(cts.testC);
