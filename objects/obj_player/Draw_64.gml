palette_set_data(1, colorModHearts, spr_hearts_palette);

for (var i = 0; i < 3; i++) {
    draw_sprite_ext(spr_hearts, 0, 64 + 72 * i, 64, 4, 4, 0, c_white, 1);
}

if (talking) {
    palette_set_data(1, colorModNineslice, spr_nineslice_palette);
    draw_sprite_stretched(spr_nineslice, 0, 0, window_get_height() - 128, window_get_width(), 128);
    shader_reset();
    
    draw_set_font(fnt_game);
    draw_text_colour(32, window_get_height() - 96, string_copy(talking.text, 1, talking_t), c_black, c_black, c_black, c_black, 1);
    
    if (talking_t < string_length(talking.text)) {
        talking_t++;
    } else {
        if (keyboard_check_pressed(vk_space)) {
            talking = noone;
            talking_t = 0;
        }
    }
}

shader_reset();

colorMod.DebugDrawPalette(64, 128, 32);

draw_set_font(fnt_game);
draw_set_colour(c_black);
draw_text(20, 20, $"FPS: {fps} / {game_get_speed(gamespeed_fps)}");
draw_text(300, 20, $"real: {fps_real}");

switch (global.palette_method) {
    case EPaletteSwapMethods.NONE:
        draw_text(500, 20, "Palette method (tab to cycle): None");
        break;
    case EPaletteSwapMethods.ITERATIVE:
        draw_text(500, 20, "Palette method (tab to cycle): Iterative");
        break;
    case EPaletteSwapMethods.INDEXED:
        draw_text(500, 20, "Palette method (tab to cycle): Indexed");
        break;
    case EPaletteSwapMethods.COLORMOD:
        draw_text(500, 20, "Palette method (tab to cycle): Colo[u]rMod");
        break;
}