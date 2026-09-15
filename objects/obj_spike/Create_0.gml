ADD_OBJECT_EVENT_GML_HOOK;
image_speed = 0.35
depth = 1
fake = 0

if (string_pos("normalT_", room_get_name(room)) || string_pos("AT_", room_get_name(room))){
	x += 16
	y += 16
	sprite_index = spr_spitcheese_spike
}