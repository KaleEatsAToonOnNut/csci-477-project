enum CState { ENTER, MOVE_TO_SEAT, SIT, ORDER, WAIT, LEAVE }

/// oCustomer: Create
state       = CState.ENTER;
move_speed  = 1.5;           // 스폰 시 Spawner가 덮어쓸 수 있음
target_seat = noone;
order_item  = undefined;

image_xscale = -1;           // 왼쪽에서 오른쪽으로 걸어와서 기본은 오른쪽 바라보기
sit_offset_x = 0;
sit_offset_y = 0;

order_delay_min = room_speed * 0.5;  // 착석 후 주문까지 0.5~1.2초
order_delay_max = room_speed * 1.2;

leave_speed = 1.8;           // 나갈 때 속도

// 도착 판정
arrive_eps = 1.0;