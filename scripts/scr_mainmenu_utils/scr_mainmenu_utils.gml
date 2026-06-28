function port_mainmenu_option(_title, _x, _y, _click_func = noone, _step_func = noone, _page_draw_func = noone) constructor
{
	title = _title;
	x = _x;
	y = _y;
	click_func = _click_func;
	step_func = _step_func;
	page_draw_func = _page_draw_func;
}



function port_mainmenu_level_select()
{
	with(other)	
	{
		instance_create(x, y, obj_levelselect);
		instance_destroy();
	}
}

function port_mainmenu_newstuff_click()
{
	global.forcehidecontrols = true;
	with(obj_virtual_controller) 
		event_perform(ev_mouse, ev_global_left_button);
	
	with(other)
	{
		up_key = virtual_key_add(2, 388, 64, 64, vk_up);
		down_key = virtual_key_add(2, 452, 64, 64, vk_down);
		close_key = virtual_key_add(2356 * 0.01-16, 1080 * 0.02 - 16, 32, 32, ord("X"));
	}
	
	layer_set_visible(layer_get_id("Assets_1"), false);
	layer_set_visible(layer_get_id("Backgrounds_1"), false);
	layer_set_visible(layer_get_id("Backgrounds_2"), true);
}

function port_mainmenu_newstuff_step()
{
	with(other)
	{
		stringoffset -= (key_down - key_up) * scrollspeed;
		
		if(key_slap2)
		{
			layer_set_visible(layer_get_id("Assets_1"), true);
			layer_set_visible(layer_get_id("Backgrounds_1"), true);
			layer_set_visible(layer_get_id("Backgrounds_2"), false);
			
			virtual_key_delete(up_key);
			virtual_key_delete(down_key);
			virtual_key_delete(close_key);
			
			up_key = noone;
			down_key = noone;
			close_key = noone;
			page = noone;
			
			
			global.forcehidecontrols = false;
			with(obj_virtual_controller) 
				event_perform(ev_mouse, ev_global_left_button);
				
			scr_soundeffect(sfx_enemyprojectile);
		}
	}
}

function port_mainmenu_newstuff_draw()
{
	with(other)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_left);
		draw_set_color(c_white);
		draw_set_font(titlefont);
		draw_set_alpha(0.5);
		draw_set_font(subtextfont2);
		draw_roundrect_color_ext(50, 80 + stringoffset, 910, 100 + (string_height_ext(textstring, 36, 1600)) + stringoffset, 10, 10, c_black, c_black, false);
		draw_set_font(titlefont);
		draw_roundrect_color_ext(50, 25 + stringoffset, 910, 75 + stringoffset, 10, 10, c_black, c_black, false);
		draw_set_alpha(1);
		draw_text(480, 35 + stringoffset, "NEW STUFF");
	
		draw_set_halign(fa_left);
		draw_set_font(global.creditsfont);
		draw_text_ext(80, 90 + stringoffset, textstring2, 36, 1600);
	
		draw_set_font(subtextfont2);
		draw_text_ext(80, 90 + stringoffset, textstring, 36, 1600);
		draw_sprite_ext(spr_virtual_controller, 0, 38, 432, 1, 1, 0, c_white, 0.5);
		draw_sprite_ext(spr_virtual_controller, 0, 38, 498, 1, 1, 180, c_white, 0.5);
		draw_sprite_ext(spr_button_escape, 0, 2356 * 0.01, 1080 * 0.02, 1, 1, 0, c_white, 0.5);
	}
}

function port_mainmenu_credits_click()
{
	global.forcehidecontrols = true;
	with(obj_virtual_controller) 
		event_perform(ev_mouse, ev_global_left_button);
	
	with(other)	
		close_key = virtual_key_add(25 - 21, 25 - 22, 42, 45, ord("X"));

	layer_set_visible(layer_get_id("Assets_1"), false);
	layer_set_visible(layer_get_id("Backgrounds_1"), false);
	layer_set_visible(layer_get_id("Backgrounds_stillscroll"), true);
}

function port_mainmenu_credits_step()
{
	with(other)
	{
		if(key_slap2)
		{
			layer_set_visible(layer_get_id("Assets_1"), true);
			layer_set_visible(layer_get_id("Backgrounds_1"), true);
			layer_set_visible(layer_get_id("Backgrounds_stillscroll"), false);
			
			virtual_key_delete(close_key);
	
			close_key = noone;
			page = noone;
			
			global.forcehidecontrols = false;
			with(obj_virtual_controller) 
				event_perform(ev_mouse, ev_global_left_button);
			
			scr_soundeffect(sfx_enemyprojectile);
		}
	}
}

function port_mainmenu_credits_draw()
{
	live_auto_call;
	with(other)
	{
		//draw_sprite(bg_creditsoverlay, 0, 0, 0);
		draw_set_halign(fa_center);
		draw_set_valign(fa_left);
		draw_set_color(c_white);
		draw_set_font(titlefont);
		draw_text(480, 100, "TOUR DE PIZZA");
		draw_text(480, 190, "MAIN_THING");
		draw_text(480, 280, "PRIMARY_THING");
		draw_text(480, 370, "ATESQUIK AND D");
		draw_set_font(subtextfont2);
		draw_text(480, 140, "Created Pizza Tower");
		draw_text(480, 230, "Port Creator");
		draw_text(480, 320, "Art and Concepts");
		draw_text(480, 410, "Helped with shaders");
		draw_sprite_ext(spr_button_escape_big, 0, 25, 30, 1, 1, 0, c_white, 0.5);
	}
}

function port_mainmenu_discord_click()
{
	with(other)
	{
		discord_dialogue = 
		show_question_async
		(
			irandom_range(0, 99) ? 
			"Do you really want to join the chaos of the discord?" : 
			"Do you accept the terms and conditions of your car's warranty?"
		)
	}
}