// 아직도 멈춰있다면 idle로 전환
if (sprite_index == spr_walk && image_speed == 0 && hsp == 0) {
    sprite_index = spr_idle;
    image_index = 0;
    image_speed = 1;
}
// 그 사이에 다시 움직이면 Step에서 just_started_moving으로 처리되어
// 걷기 0프레임부터 재생되므로 여기선 아무 것도 안 해도 됨