if (instance_exists(ObjectPlayer)) {
    var p = instance_find(ObjectPlayer, 0);

    var px = 30;
    var py = 60;

    var st_percent = clamp(p.stamina / p.max_stamina, 0, 1);
    var scale = 1.5;

    // base 
    var fill_offset_x = 0.5;
    var fill_offset_y = 0.01;
    var fill_max_w = 99;
    var fill_h = 16;

    // background
    draw_sprite_ext(spr_HealthBarBg, 0, px, py, scale, scale, 0, c_white, 1);

    // fill
    draw_sprite_stretched(
        spr_staminabar,
        0,
        px + fill_offset_x * scale,
        py + fill_offset_y * scale,
        (fill_max_w * st_percent) * scale,
        fill_h * scale
    );

    // boarder
    draw_sprite_ext(spr_HealthBarBorder, 0, px, py, scale, scale, 0, c_white, 1);

    // text
    draw_set_font(global.font_main);
    draw_set_color(c_white);
    draw_text(px + 55, py + 5, string(p.stamina) + " / " + string(p.max_stamina));
}