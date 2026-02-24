draw_self();

if (show_g) {
	var px = x + prompt_off_x;
    var py = y + prompt_off_y;

    draw_set_font(prompt_font);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // 그림자(선택)
    draw_set_color(prompt_shadow);
    draw_text(px+1, py+1, "G");

    // 본문 색
    draw_set_color(prompt_color);
    draw_text(px, py, "G");

    // 상태 복구(선택)
    draw_set_color(c_white);
}