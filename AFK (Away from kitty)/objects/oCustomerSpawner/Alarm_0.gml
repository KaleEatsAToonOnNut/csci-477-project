var num_can_spawn = (global.customer_count < max_customers);
var free_exists   = (seats_free_count(seats) > 0);

if (num_can_spawn && free_exists) {
    // 빈 좌석 하나 예약해놓고 스폰
    var seat = pick_free_seat(seats);
    if (seat != noone) {
        // 손님 생성
        var cust = instance_create_layer(spawn_x, spawn_y, "Player", oCustomer);
        cust.move_speed = random_range(walk_speed_min, walk_speed_max);
        cust.target_seat = seat;               // 우선 목적 좌석 지정
        cust.order_item  = get_random_menu_item();
        global.customer_count++;

        // 좌석 선점(중복 경합 방지)
        seat.occupied    = true;
        seat.occupant_id = cust.id;
    }
}

// 다음 스케줄
alarm[0] = irandom_range(spawn_delay_min, spawn_delay_max);