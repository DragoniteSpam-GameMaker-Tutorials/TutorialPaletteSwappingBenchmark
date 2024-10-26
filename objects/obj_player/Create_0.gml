event_inherited();

talking = noone;
talking_t = 0;

running = false;
casting_frame = 0;

if (!audio_is_playing(bgm_idle_with_accordions)) {
    audio_play_sound(bgm_idle_with_accordions, 100, true);
}

layer_script_begin(layer_get_id("tiles"), function() {
    static colorMod = ColorModFromSprite(spr_main_palette, 0, true);
    palette_set_data(1, colorMod, spr_main_palette);
});

layer_script_end(layer_get_id("tiles"), function() {
    shader_reset();
});

colorModHearts = ColorModFromSprite(spr_hearts_palette, 0, true);
colorModNineslice = ColorModFromSprite(spr_nineslice_palette, 0, true);
/*
repeat (100) {
    instance_create_depth(random(room_width), random_range(64, room_height), 0, obj_tree);
}

repeat (250) {
    instance_create_depth(random(room_width), random_range(64, room_height), 0, obj_grass);
}
*/

trees = array_create_ext(100 * 2, function(index) {
    return (index % 2 == 0) ? random(room_width) : random_range(64, room_height);
});

grass = array_create_ext(250 * 2, function(index) {
    return (index % 2 == 0) ? random(room_width) : random_range(32, room_height);
});

colorModTrees = ColorModFromSprite(spr_tree_round_palette, 0, true);
colorModGrass = ColorModFromSprite(spr_grass_short_palette, 0, true);