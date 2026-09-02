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
	with(obj_player){
		state = states.bossintro
		sprite_index = spr_bossintro
		scr_soundeffect(sfx_scream5)
	}
}
if ((!instance_exists(obj_cloudeffect)) && hspeed != 0)
    instance_create(x, (y + 43), obj_cloudeffect)
if(image_xscale == -1){
	global.combotime = 60
}