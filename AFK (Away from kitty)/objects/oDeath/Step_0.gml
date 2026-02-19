var p = instance_nearest(x, y, oPlayer);
if (p == noone) exit;

// 방향 반전(데드존 적용)
var dx = p.x - x;
if (dx >  deadzone)  image_xscale = 1;
if (dx < -deadzone)  image_xscale = -1;

// 범위 체크(가벼운 버전)
var r2 = sqr(talk_range);
var d2 = sqr(p.x - x) + sqr(p.y - y);
var in_range = (d2 <= r2);

// 텍스트박스 열려있는지
var tb_open = instance_exists(oTextbox);

// Draw에서 사용할 플래그
show_g = in_range && !tb_open;

// G키로 대화 시작
if (show_g && keyboard_check_pressed(ord("G"))) {
    create_textbox(talk_id);   // "death" 블록 시작
}