live_auto_call;
if(!instance_exists(obj_option))
{
    scr_getinput()
    if(!instance_exists(obj_fadeout))
    {
		if(page == noone)
		{	
			var _input = (key_down2 - key_up2);
		
			if(_input != 0)
				scr_soundeffect(sfx_step);
			
			selected_option += _input;
			
			selected_option = clamp(selected_option, 0, max_options);
		}
    }
	
	var _option = text_arr[selected_option];
	with(_option)
	{
		if(other.key_jump)
		{
			if(click_func != noone)
			{
				var _snip = USE_GMLIVE ? live_snippet_call : NSP_execute_saved;
				var _exec = is_struct(click_func) ? _snip : script_execute;
				
				_exec(click_func);
			}
			
			if(page_draw_func == noone)
				break;
				
			with(other)
				page = selected_option;
		}
		
		if(step_func != noone && other.page == other.selected_option)
		{
			var _snip = USE_GMLIVE ? live_snippet_call : NSP_execute_saved;
			var _exec = is_struct(step_func) ? _snip : script_execute;
				
			_exec(step_func);
		}
	}

	prev_key_jump2 = key_jump2
}