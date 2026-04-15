selected_option = 0
max_options = 3
prev_key_jump2 = 0
newstuff = 0
credits = 0
stickpressed = 0
stringoffset = 0
scrollspeed = 2
titlefont = global.bigfont
subtextfont = global.smallfont2
subtextfont2 = global.smallfont3
mcpigicon = spr_MCPIGicon
mcpigiconoffsetx = -100
mcpigiconoffsety = 0
tngicon = spr_TNGicon
tngiconoffsetx = -120
tngiconoffsety = 0
communityicon = spr_COMMUNITYicon
communityiconoffsetx = -150
communityiconoffsety = 0
cursorindex = 0
discorddialogue = noone
close_key = noone
up_key = noone
down_key = noone
textstring = "ERROR: file[changelog.txt] DOES NOT EXIST."
textstring2 = ""
text_arr = [[480, 350, "LEVEL SELECT"], [480, 390, "WHATS NEW"], [480, 430, "CREDITS"], [480, 470, "DISCORD"]]
if(file_exists("changelog.txt"))
{
	var file_buffer = buffer_load("changelog.txt");
	textstring = buffer_read(file_buffer, buffer_string);
	buffer_delete(file_buffer);
}

for(var i = 0, _title = false;i < string_length(textstring);i++)
{
	var _char = string_byte_at(textstring, i)
	if(_char = ord("\n"))
	{
		textstring2 += "\n^"
		_title = false
	}
	if(_title)
	{
		textstring2 += chr(_char)
		textstring = string_set_byte_at(textstring, i, ord(" "))
	}
	if(i == 0)
		continue
	var _char_prev = string_byte_at(textstring, i - 1)
	if(_char = ord("#") && _char_prev = ord("\n"))
		_title = true
}
show_message(textstring2)