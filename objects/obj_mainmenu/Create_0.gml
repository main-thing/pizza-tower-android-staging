selected_option = 0;

stringoffset = 0;
scrollspeed = 2;
titlefont = global.bigfont;
subtextfont = global.smallfont2;
subtextfont2 = global.smallfont3;

cursorindex = 0
discord_dialogue = noone
close_key = noone
up_key = noone
down_key = noone
textstring = "ERROR: file[changelog.txt] DOES NOT EXIST."
textstring2 = ""

page = noone;

text_arr = 
[
	new port_mainmenu_option("LEVEL SELECT", 480, 350, port_mainmenu_level_select),
	new port_mainmenu_option("CHANGELOG", 480, 390, port_mainmenu_newstuff_click, port_mainmenu_newstuff_step, port_mainmenu_newstuff_draw),
	new port_mainmenu_option("CREDITS", 480, 430, port_mainmenu_credits_click, port_mainmenu_credits_step, port_mainmenu_credits_draw),
	new port_mainmenu_option("DISCORD", 480, 470, port_mainmenu_discord_click)
]

max_options = array_length(text_arr) - 1;

event_user(0);