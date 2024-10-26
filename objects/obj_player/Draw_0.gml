if (casting_frame == 0) {
    sprite_index = running ? spr_duckling_run : spr_duckling;
    palette_index = running ? spr_duckling_run_palette : spr_duck_palette;
    event_inherited();
} else {
    palette_index = spr_duckling_cast_palette;
    palette_set_data(1, colorMod, palette_index);
    var frame_count = sprite_get_number(spr_duckling_cast) / 4;
    draw_sprite(spr_duckling_cast, ((anim_dir + 1) * frame_count) - casting_frame, x, y);
}
/*
palette_set_data(1, colorModGrass, spr_grass_short_palette);

for (var i = 0, n = array_length(grass); i < n; i += 2) {
    draw_sprite(spr_grass_short, 0, grass[i], grass[i + 1]);
}

palette_set_data(1, colorModGrass, spr_tree_round_palette);

for (var i = 0, n = array_length(trees); i < n; i += 2) {
    draw_sprite(spr_tree_round, 0, trees[i], trees[i + 1]);
}*/