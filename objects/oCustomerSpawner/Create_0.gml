// 설정
max_customers   = 7;
var view_left = camera_get_view_x(view_camera[0]); // 현재 뷰의 왼쪽
spawn_x = view_left - 32;                           // 화면 바깥에서 등장       // 왼쪽 밖에서 등장
spawn_y         = 465;                     // 통로 높이(스크린샷에 맞게 조정)
walk_speed_min  = 1.2;
walk_speed_max  = 1.8;
spawn_delay_min = room_speed * 2;          // 2~5초 랜덤
spawn_delay_max = room_speed * 5;

// 좌석 목록 수집
seats = ds_list_create();
with (ocustomer_sit) {
    ds_list_add(other.seats, id);
}

// 주문 큐 없으면 만들기
if (!variable_global_exists("orders")) {
    global.orders = ds_list_create();
}

// 현재 손님 수 전역 카운터
if (!variable_global_exists("customer_count")) global.customer_count = 0;

// 첫 스케줄
alarm[0] = irandom_range(spawn_delay_min, spawn_delay_max);