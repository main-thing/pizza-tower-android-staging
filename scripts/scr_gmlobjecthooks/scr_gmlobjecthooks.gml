global.enable_object_gml_event_hooks = false;
global.object_gml_event_hooks_map = ds_map_create();
#macro ADD_OBJECT_EVENT_GML_HOOK if(global.enable_object_gml_event_hooks)\
{\
	var ___h = ds_map_find_value(global.object_gml_event_hooks_map, debug_get_callstack(1)[0]);\
	if(___h)\
	{\
		live_snippet_call(___h);\
		exit;\
	}\
}

function gml_hook_object_event(object, event, code)
{
	global.object_gml_event_hooks_map[? "gml_Object_" + object + "_" + event + ":1"] = live_snippet_create(code);
}