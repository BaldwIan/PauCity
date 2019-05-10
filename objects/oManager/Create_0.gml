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

// First Journal Entry
var jTitleIntro = "agent: 80 65 85";
var jContentIntro = file_read("jIntro.txt");
var jDateIntro = "assignment: 67 73 84 89";
var jAuthorIntro = "Null";
add_journal_entry(jTitleIntro, jContentIntro, jDateIntro, jAuthorIntro);

room_goto(rm1);



