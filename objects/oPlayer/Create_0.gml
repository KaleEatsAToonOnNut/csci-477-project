hsp = 0;
walksp = 4;

spr_idle = sPlayer;     // idle
spr_walk = sPlayerW;    // walking

anim_lock_until_end = false; // 멈춘 순간, 걷기 사이클 끝까지 보류
walk_end_hold_frames = 5;    // 걷기 0프레임 ‘정지’ 유지 프레임 수(원하면 조절)

was_moving = false; 

walk_min_frames_to_show = 8; // 6프레임(≈0.1s@60fps) 이상 움직여야 걷기 표시
move_frames = 0;             // 연속 이동 프레임 카운터

hascontrol = true;