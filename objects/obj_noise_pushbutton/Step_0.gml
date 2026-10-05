ADD_OBJECT_EVENT_GML_HOOK;
if (sprite_index == noise_button_sprite && floor(image_index) == (image_number - 1))
{
    hspeed = 3
    image_xscale = 1
    sprite_index = noise_walk_sprite
}
if (floor(image_index) == 53 && !activate)
{
	activate = 1
    global.panic = 1
	global.minutes = minutes 
	global.seconds = seconds 
	global.fill = ((global.minutes * 60) + global.seconds) * 12
	with(obj_tv)
		chunkmax = global.fill
	with(obj_player) {
		state = states.bossintro
		sprite_index = spr_bossintro
		scr_soundeffect(sfx_scream5)
	}
}
if ((!instance_exists(obj_cloudeffect)) && hspeed != 0)
    instance_create(x, (y + 43), obj_cloudeffect)
if(image_xscale == -1) {
	global.combotime = 60
}

//demo 2
if (sprite_index == spr_noise_button && floor(image_index) == (image_number - 1))
{
    hspeed = 2.8;
    image_xscale = 1;
    sprite_index = spr_noise_walk;
}

if (floor(image_index) == 86)
{
    global.panic = 1;
    obj_player.image_index = 0;
    obj_player.sprite_index = spr_player_bossintro;
}

scr_collideandmove();
