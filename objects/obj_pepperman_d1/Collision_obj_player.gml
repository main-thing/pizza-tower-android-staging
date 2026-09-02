if (obj_player.y < y && obj_player.state == states.jump)
{
    with (obj_player)
    {
		stompAnim = 1;
		image_index = 0;
	    sprite_index = spr_stompprep;
		instance_create(x, (y + 50), obj_stompeffect);
	    scr_soundeffect(sfx_stompenemy);
        if key_jump2
			vsp = -14;
        else
			vsp = -9;
    }
}
if (obj_player.state == states.mach2 && obj_player.sprite_index == obj_player.spr_mach)
{
    instance_create(obj_player.x, obj_player.y, obj_bumpeffect);
    movespeed = 0;
    obj_player.state = states.tackle;
    obj_player.image_index = 0;
    if (obj_player.x != x)
        image_xscale = sign((obj_player.x - x));
    hsp = (sign((x - obj_player.x)) * 4);
    vsp = -3;
    if (sprite_index != hurtspr)
    {
        sprite_index = stunspr;
        charging = 0;
        stunned = 1;
        alarm[1] = 100;
    }
}
if (obj_player.state == states.mach3)
{
    scr_soundeffect(sfx_killenemy);
    obj_camera.shake_mag = 3;
    obj_camera.shake_mag_acc = (4 / room_speed);
    repeat(3)
		instance_create(x, y, obj_slapstar);
    hp -= 1;
    flash = 1;
    charging = 0;
    stunned = 1;
    movespeed = 0;
    obj_player.state = states.tackle;
    obj_player.image_index = 0;
    if (obj_player.x != x)
        image_xscale = sign((obj_player.x - x));
    hsp = (sign((x - obj_player.x)) * 6);
    vsp = -8;
    if (hp == 10)
    {
        alarm[1] = 100;
        alarm[0] = 100;
    }
    if (hp == 9)
    {
        alarm[1] = 90;
        alarm[0] = 90;
    }
    if (hp == 8)
    {
        alarm[1] = 80;
        alarm[0] = 80;
    }
    if (hp == 7)
    {
        alarm[1] = 70;
        alarm[0] = 70;
    }
    if (hp == 6)
    {
        alarm[1] = 60;
        alarm[0] = 60;
    }
    if (hp == 5)
    {
        alarm[1] = 50;
        alarm[0] = 50;
    }
    if (hp == 4)
    {
        alarm[1] = 40;
        alarm[0] = 40;
    }
    if (hp == 3)
    {
        alarm[1] = 30;
        alarm[0] = 30;
    }
    if (hp == 2)
    {
        alarm[1] = 30;
        alarm[0] = 30;
    }
    if (hp == 1)
    {
        alarm[1] = 30;
        alarm[0] = 30;
    }
    if (hp > 6)
        sprite_index = spr_pepperman_hurt;
    if (hp <= 6 && hp > 3)
        sprite_index = spr_peppermanmid_hurt;
    else if (hp <= 3)
        sprite_index = spr_peppermanlow_hurt;
}
with (obj_player)
{
    if (state != states.tackle && state != states.hurt && (!(y < other.y)) && state != states.grab && state != states.superslam && grabbing == 0 && other.stunned == 0)
    {
        if (x != other.x)
            xscale = (-(sign((x - other.x))));
        hsp = ((-xscale) * 4);
        vsp = -4;
        image_index = 0;
        state = states.bump;
    }
}