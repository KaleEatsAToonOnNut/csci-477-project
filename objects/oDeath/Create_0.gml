
// oDeath - Create (맨 위에 배치)
if (!variable_global_exists("font_main") || global.font_main == -1) {
    // 스프라이트 폰트를 쓰는 경우(현재 설정과 동일)
    global.font_main = font_add_sprite(sMainFont, 32, true, 1);

    // 시스템 폰트를 쓸 경우(선택): 위 한 줄을 주석 처리하고 아래를 사용
    // global.font_main = font_add("Noto Sans", 28, false, false, 0, 2048);
}

// 시작 바라보는 방향 (스프라이트 기본이 '오른쪽'이면 1, '왼쪽'이면 -1)
image_xscale = 1;

// 경계 흔들림 방지(픽셀 단위 데드존) — Step에서 사용
deadzone = 2;  // 1~3 사이 취향대로



// 대화 설정
talk_id      = "death";   // 이 NPC의 대화 블록 ID
talk_range   = 64;        // 상호작용 거리

show_g       = false;
// 스프라이트 기본이 오른쪽이면 1, 왼쪽이면 -1
image_xscale = 1;

prompt_font   = global.font_main;           // 다른 폰트를 쓰고 싶으면 바꾸기
prompt_color  = make_color_rgb(255,240,200);
prompt_shadow = make_color_rgb(20,20,30);
prompt_off_x  = 0;      // X 위치 오프셋
prompt_off_y  = -48;    // Y 위치 오프셋 (높이를 바꾸고 싶으면 조절)