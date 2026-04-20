function scr_bosscontroller_particle_hp(_a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 = noone) //gml_Script_scr_bosscontroller_particle_hp
{
    with (obj_bosscontroller_1)
    {
        var q = 
        {
            type: 0,
            sprite_index: _a0,
            image_index: _a1,
            x: _a2,
            y: _a3,
            hsp: (8 * _a4),
            vsp: -6,
            spr_palette: _a5,
            paletteselect: _a6,
            palettetexture: _a7
        }

        ds_list_add(particlelist, q)
        return q;
    }
}

function scr_bosscontroller_particle_anim(_a0, _a1, _a2, _a3, _a4, _a5, _a6) //gml_Script_scr_bosscontroller_particle_anim
{
    if ((_a5 == undefined))
        _a5 = 707
    if ((_a6 == undefined))
        _a6 = 0
    with (obj_bosscontroller_1)
    {
        var q = 
        {
            type: 1,
            sprite_index: _a0,
            image_index: _a1,
            image_speed: _a4,
            x: _a2,
            y: _a3,
            spr_palette: _a5,
            paletteselect: _a6
        }

        ds_list_add(particlelist, q)
        q = q
        return q;
    }
}

function scr_bosscontroller_intro() //gml_Script_scr_bosscontroller_intro
{
    with (obj_player)
    {
        state = states.actor
        image_blend = make_colour_hsv(0, 0, 255)
        hsp = 0
        movespeed = 0
        flash = false
        x = roomstartx
    }
    with (bossID)
    {
        if ((state != states.actor))
            other.bossintrostate = state
        state = states.actor
        x = xstart
        y = ystart
        hsp = 0
        vsp = 0
    }
    flamey -= 4
    if ((introshake > 0))
        introshake -= introshake_acc
    var a = 0.1
    if ((arenabuffer > 0))
        arenabuffer--
    else
    {
        switch arenastate
        {
            case states.normal:
                var ptx = 0
                playerx = lerp(playerx, ptx, a)
                if ((abs((playerx - ptx)) <= 10))
                    arenastate++
                break
            case states.revolver:
                var btx = obj_screensizer.draw_width
                bossx = lerp(bossx, btx, a)
                if ((abs((bossx - btx)) <= 10))
                {
                    arenastate++
                    scr_soundeffect(sfx_boss_introduction)
                }
                break
            case states.dynamite:
                whitefade += 0.02
                if ((whitefade >= 2))
                {
                    whitefade = 0
                    arenastate++
                    arenabuffer = 300
                    introshake = 20
                    introshake_acc = 0.5
                }
                break
            case states.boots:
                state = states.normal
                with (obj_player)
                {
                    state = states.actor
                    hsp = 0
                    movespeed = 0
                    flash = false
                    x = roomstartx
                }
                with (bossID)
                {
                    skipintro = false
                    state = other.bossintrostate
                }
                break
        }

    }
}

function scr_bosscontroller_normal() //gml_Script_scr_bosscontroller_normal
{
    if ((boss_func != -4))
        self.boss_func()
    if ((boss_prevhp != boss_hp))
    {
        if ((boss_prevhp > boss_hp))
        {
            boss_prevhp = boss_hp
            var pos = scr_bosscontroller_get_health_pos((boss_hp + 1), boss_rowmax, boss_columnmax, boss_maxhp, boss_hp_x, boss_hp_y, boss_xpad, boss_ypad, true)
            if ((!is_undefined(pos)) && is_array(pos))
            {
                var bpal = boss_palette
                var bpalsel = pos[2]
                var btex = -4
                if ((boss_hpsprite == spr_bossfight_fakepephp))
                {
                    bpal = spr_peppalette
                    bpalsel = obj_player1.paletteselect
                    btex = global.palettetexture
                }
                scr_bosscontroller_particle_hp(boss_hpsprite, irandom((sprite_get_number(boss_hpsprite) - 1)), pos[0], pos[1], -1, bpal, bpalsel, btex)
            }
        }
        else if ((boss_prevhpbuffer > 0))
            boss_prevhpbuffer--
        else
        {
            boss_prevhpbuffer = 10
            boss_prevhp++
            pos = scr_bosscontroller_get_health_pos(boss_prevhp, boss_rowmax, boss_columnmax, boss_maxhp, boss_hp_x, boss_hp_y, boss_xpad, boss_ypad, true)
            if ((!is_undefined(pos)) && is_array(pos))
                scr_bosscontroller_particle_anim(spr_genericpoofeffect, 0, (pos[0] - 30), (pos[1] - 30), 0.5)
        }
    }
    if ((!instance_exists(bossID)) && (!bossdead) && instance_exists(obj_player1) && (obj_player1.state != states.tackle) && (obj_player1.state != states.comingoutdoor) && (room != boss_fakepephallway) && (room != boss_pizzaface) && (room != rank_room))
    {
        if ((room != boss_vigilante) || (obj_player1.state != states.actor))
        {
            bossdead = true
            notification_push((49 << 0), [room])
            alarm[0] = 480
            with (obj_player1)
            {
                //fmod_event_instance_play(global.snd_bossbeaten)
                global.pistol = false
                pistolanim = -4
                sprite_index = spr_player_levelcomplete
                image_speed = 0.35
                image_index = 0
                state = states.arenaintro
            }
            with (obj_hppickup)
            {
                scr_collect_hat()
                instance_destroy()
            }
            with(obj_music)
			{
				audio_stop_sound(musicID)
				music = mu_empty
				musicID = scr_music(music)
			}
        }
    }
    if ((!bossdead) && (player_hp <= 0) && (alarm[3] == -1) && (!instance_exists(obj_bossplayerdeath)))
    {
        player_hp = 0
        //instance_create(0, 0, obj_bossplayerdeath)
    }
}

function scr_bosscontroller_victory() //gml_Script_scr_bosscontroller_victory
{
    if ((victory_buffer > 0))
        victory_buffer--
    else if (!instance_exists(obj_bosskeynoise))
    {
        if ((player_hp > 0))
        {
            victory_buffer = 25
            var pos = scr_bosscontroller_get_health_pos(player_hp, player_rowmax, player_columnmax, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad)
            player_hp--
            with (instance_create(pos[0], pos[1], obj_hpeffect))
            {
                x_to = obj_player1.x
                y_to = obj_player1.y
                spd = 16
                finish = true
            }
        }
        else if ((!instance_exists(obj_hpeffect)) && (!instance_exists(obj_endlevelfade)))
        {
            with (obj_player1)
                scr_do_rank(false, true)
        }
    }
}

function scr_bosscontroller_pizzaface_p3_health() //gml_Script_scr_bosscontroller_pizzaface_p3_health
{
    for (var e = elitehit; e > 2; e -= 2)
    {
    }
    var eh = ((e + ((e - 1) * pizzahead_maxsubhp)) + pizzahead_subhp)
    return eh;
}

function scr_bosscontroller_draw_health(_a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 = noone, _a12 = noone, _a13 = noone) //gml_Script_scr_bosscontroller_draw_health
{
    var hpp = 0
    var _index = 0
    while ((hpp < _a4))
    {
        var c = c_white
        var zpad = (_index * 3)
        if ((_a11 != noone))
        {
            if ((_a12 == noone))
                pal_swap_set(_a11, _index, false)
            else
                pal_swap_set(_a11, _a12, false)
        }
        var _x = 0
        var _y = 0
        repeat (_a1 * _a2)
        {
            if ((_index == 0) && (_a3 < (_a1 * _a2)) && (hpp >= _a3))
                c = c_black
            if ((_index == 0) || (hpp < _a3))
            {
                var xf = ((_a5 + (_x * _a7)) - zpad)
                var yf = ((_a6 + (_y * _a8)) - zpad)
                //if ((argument13 != -4))
                    //pattern_set(global.Base_Pattern_Color, _a0, _a9, 1, 1, _a13)
                draw_sprite_ext(_a0, _a9, xf, yf, 1, 1, 0, c, _a10)
            }
            _x++
            if ((_x >= _a2))
            {
                _x = 0
                _y++
            }
            hpp++
        }
        _index++
    }
    //pattern_reset()
}

function scr_bosscontroller_get_health_pos(_a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8) //gml_Script_scr_bosscontroller_get_health_pos
{
    if ((_a8 == undefined))
        _a8 = false
    var hpp = 0
    var _index = 0
    while ((hpp < _a3))
    {
        var zpad = (_index * 3)
        var _x = 0
        var _y = 0
        repeat (_a1 * _a2)
        {
            hpp++
            if ((hpp >= _a0))
            {
                var q = [((_a4 + (_x * _a6)) - zpad), ((_a5 + (_y * _a7)) - zpad), _index]
                return q;
            }
            _x++
            if ((_x >= _a2))
            {
                _x = 0
                _y++
            }
        }
        _index++
    }
    return undefined;
}

function scr_collect_hat(_a0) //gml_Script_scr_collect_hat
{
    if ((_a0 == undefined))
        _a0 = false
    with (obj_bosscontroller_1)
    {
        if (((player_hp + instance_number(obj_hpeffect)) < player_maxhp))
        {
             scr_soundeffect(sfx_cardcollect)
            var pos = scr_bosscontroller_get_health_pos((player_hp + 1), player_rowmax, player_columnmax, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad)
            with (instance_create(other.x, other.y, obj_hpeffect))
            {
                if _a0
                    persistent = true
                image_index = other.image_index
                x_to = pos[0]
                y_to = pos[1]
            }
        }
        else
        {
            with (other)
            {
                scr_soundeffect(sfx_collecttopping)
                with (obj_camera)
                    healthshaketime = 30
                var val = 50
                scr_soundeffect(sfx_cardcollect)
                global.extrahats++
                with (instance_create(x, y, obj_smallnumber))
                    number = "+1"
            }
        }
    }
}

