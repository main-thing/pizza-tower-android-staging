ADD_OBJECT_EVENT_GML_HOOK;
if (global.panic == true)
	visible = true
else
	visible = false
if (flip)
	sprite_index = spr_exitsignL
if (sprite_index == spr_exitsign && oldblock)
	sprite_index = spr_exitsign1