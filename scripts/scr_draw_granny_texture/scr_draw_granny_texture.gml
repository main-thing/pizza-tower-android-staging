function scr_draw_granny_texture(x, y, xscale, yscale, tex_x, tex_y, sprite = spr_pizzagrannytexture, bubble_sprite = spr_tutorialbubble)
{
    var w = (sprite_get_width(bubble_sprite) * xscale);
    var h = (sprite_get_height(bubble_sprite) * yscale);

    if !surface_exists(surfclip)
        surfclip = surface_create(w, h);
    if !surface_exists(surffinal)
        surffinal = surface_create(w, h);

    surface_set_target(surfclip);
    draw_clear_alpha(c_black, 1);
    gpu_set_blendmode(bm_subtract);
    draw_sprite_ext(bubble_sprite, 0, 0, 0, xscale, yscale, 0, c_white, 1);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();

    surface_set_target(surffinal);
    draw_clear_alpha(c_black, 0);
    draw_sprite_tiled(sprite, 0, tex_x, tex_y);
    gpu_set_blendmode(bm_subtract);
    draw_surface(surfclip, 0, 0);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();

    draw_surface(surffinal, x, y);
} 
