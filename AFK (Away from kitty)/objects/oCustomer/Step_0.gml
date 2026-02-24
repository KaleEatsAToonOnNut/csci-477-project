/// oCustomer: Step
switch (state) {
    case CState.ENTER:
        // 목표 좌석이 정해졌는지 확인
        if (target_seat == noone || !instance_exists(target_seat)) {
            // 좌석이 사라지면 즉시 제거
            state = CState.LEAVE;
            break;
        }
        // 좌석 앞으로 이동 시작
        state = CState.MOVE_TO_SEAT;
        break;

    case CState.MOVE_TO_SEAT:
        if (!instance_exists(target_seat)) { state = CState.LEAVE; break; }

        var tx = target_seat.sit_x + sit_offset_x;
        var ty = target_seat.sit_y + sit_offset_y;

        var dx = tx - x;
        var dy = ty - y;
        var dist = point_distance(x, y, tx, ty);

        if (dist > arrive_eps) {
            var ang = point_direction(x, y, tx, ty);
            x += lengthdir_x(move_speed, ang);
            y += lengthdir_y(move_speed, ang);
            image_xscale = (dx >= 0) ? 1 : -1;
        } else {
            x = tx; y = ty;
            state = CState.SIT;
            image_speed = 0;   // 필요 시 앉은 스프라이트로 교체
        }
        break;

    case CState.SIT:
        // 잠깐 대기 후 주문
        alarm[0] = irandom_range(order_delay_min, order_delay_max);
        state = CState.ORDER;
        break;

    case CState.ORDER:
        // 주문 push (한 번만)
        if (order_item != undefined) {
            var m = ds_map_create();
            ds_map_add(m, "customer_id", id);
            ds_map_add(m, "seat_id",     target_seat.id);
            ds_map_add(m, "item",        order_item);
            ds_list_add(global.orders, m);
        }
        state = CState.WAIT;
        break;

    case CState.WAIT:
        // 서빙되면 LEAVE로 넘어가도록 외부에서 호출해 줄 함수 사용 (아래 참조)
        // 여기서는 그냥 대기
        break;

    case CState.LEAVE:
        // 왼쪽으로 퇴장
        var view_left = camera_get_view_x(view_camera[0]);
		var tx2 = view_left - 40;           // 화면 왼쪽 바깥으로 목표
        var ty2 = y;
        var ang2 = point_direction(x, y, tx2, ty2);
        x += lengthdir_x(leave_speed, ang2);
        y += lengthdir_y(leave_speed, ang2);
        image_xscale = -1;
        if (x <= view_left - 36) {
            instance_destroy();
        }
        break;
}
