with (obj_player) {
    if (state != states.Sjump) {
        scr_soundeffect(sfx_superjumprelease);
        sprite_index = spr_superjump;
        state = states.Sjump;
        vsp = -10;
        other.image_index = 0;
        other.image_speed = 0.35;
    }
}