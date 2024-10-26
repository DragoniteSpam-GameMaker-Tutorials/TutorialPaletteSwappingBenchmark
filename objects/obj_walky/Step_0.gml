if (moving) {
    var dx = cos(move_dir);
    var dy = -sin(move_dir);
    anim_frame = (anim_frame + 7.5 / game_get_speed(gamespeed_fps)) % 4;
    anim_dir = radtodeg(move_dir) / 90;
    x += dx * 120 / game_get_speed(gamespeed_fps);
    y += dy * 120 / game_get_speed(gamespeed_fps);
} else {
    anim_frame = 0;
}