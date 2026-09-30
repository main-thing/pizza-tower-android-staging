if (string_pos("old_medieval_", room_get_name(room)) != 0)
	oldblock = 1
if (oldblock)
{
	with (obj_player)
	{
		var _debris = spr_knightdebris
	
		if (!ispeppino || character == "N")
			_debris = spr_playerN_knightarmor
	
		if (state == states.knightpepslopes && (place_meeting(x + sign(hsp), y, obj_knightremover) && !place_meeting(x + sign(hsp), y, obj_destructibles)))
		{
			if (character != "S")
			{
				for (var i = 0; i < sprite_get_number(_debris); i++){
						with (create_debris(x, y, _debris)){
						image_index = i
						vsp = random_range(-10, -5)
						hsp = ((-obj_player.xscale) * random_range(4, 8))
						image_xscale = obj_player.xscale
					}
				}
			}
			else
			{
				repeat (6)
				{
					with (create_debris(x, y, spr_metalblockdebris)){
						image_index = random_range(0, 3);
						vsp = random_range(-4, 0)
						hsp = random_range(-4, 4)
					}
				}
			}
			alarm[5] = 2
			alarm[7] = 60
			hurted = 1
			state = states.bump
			image_index = 0
			hsp = (-5 * xscale)
			vsp = -3
			flash = 1
			scr_soundeffect(sfx_loseknight)
		}
	}
}