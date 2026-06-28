if (room != rank_room)
{
	instance_destroy(obj_fadeout)
	with (obj_player)
	{
		targetDoor = "A"
		room = timesuproom
		state = states.timesup
		sprite_index = spr_Timesup
		image_index = 0
		audio_stop_all()
		scr_soundeffect(global.oldsprites ? mu_timesup : mu_Your_Fat_Ass_Slows_You_Down);

	}
	instance_create(0, 0, obj_timesupwar)
	instance_destroy()
}
