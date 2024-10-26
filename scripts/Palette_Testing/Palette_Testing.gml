function palette_set_data(index, color_mod, sprite) {
    switch (global.palette_method) {
        case EPaletteSwapMethods.ITERATIVE:
            if (shader_current() != shd_palette) shader_set(shd_palette);
            var palette_index = shader_get_uniform(shd_palette, "palette_index");
            var palette_size = shader_get_uniform(shd_palette, "palette_size");
            var samp_targets = shader_get_sampler_index(shd_palette, "samp_targets");
            shader_set_uniform_f(palette_index, index);
            shader_set_uniform_f(palette_size, sprite_get_width(sprite), sprite_get_height(sprite));
            texture_set_stage(samp_targets, sprite_get_texture(sprite, 0));
            break;
        case EPaletteSwapMethods.INDEXED:
            if (shader_current() != shd_indexed_color) shader_set(shd_indexed_color);
            var u_palette_index = shader_get_uniform(shd_indexed_color, "u_palette_index");
            var u_palette_size = shader_get_uniform(shd_indexed_color, "u_palette_size");
            var samp_palette = shader_get_sampler_index(shd_indexed_color, "samp_palette");
            shader_set_uniform_f(u_palette_index, index);
            shader_set_uniform_f(u_palette_size, sprite_get_height(sprite));
            texture_set_stage(samp_palette, sprite_get_texture(sprite, 0));
            break;
        case EPaletteSwapMethods.COLORMOD:
            color_mod.SetShader(index);
            break;
    }
}

enum EPaletteSwapMethods {
    NONE,
    ITERATIVE,
    INDEXED,
    COLORMOD
}

global.palette_method = EPaletteSwapMethods.ITERATIVE;