// 걷기 사이클이 끝난 순간
if (sprite_index == spr_walk && anim_lock_until_end) {
    anim_lock_until_end = false;

    // 1) 스프라이트 ‘첫 프레임(0)’에서 잠깐 정지
    image_index = 0;    // "1번째 프레임" = 0번 인덱스
    image_speed = 0;

    // 2) 잠깐 보여준 뒤 idle로 전환
    alarm[0] = walk_end_hold_frames;
}