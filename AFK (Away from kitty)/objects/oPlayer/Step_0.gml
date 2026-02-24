global.inv_open = keyboard_check(vk_tab) && !instance_exists(oTextbox);


		//Get player input	
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);

if (hascontrol)
{
	//Calculate Movement
	var move = key_right - key_left;
	
	hsp = move * walksp;


	//Horizontal colliusion
	if (place_meeting(x + hsp, y, oWall))
	{
		while (!place_meeting(x + sign(hsp), y,oWall)) 
		{
			x = x + sign(hsp);	
		}
		hsp = 0;	
	}

	x = x + hsp;
}
else
{
	key_left = 0;
	key_right = 0;
}


	//Animation
	// 0프레임 정지 중일 때만 image_speed=0 유지, 그 외엔 1
	image_speed = (image_speed == 0 && sprite_index == spr_walk) ? 0 : 1;

	var is_moving = (hsp != 0);
	var just_started_moving = (is_moving && !was_moving);

	// 연속 이동 프레임 카운트
	if (is_moving) {
	    move_frames = was_moving ? (move_frames + 1) : 1;
	} else {
	    move_frames = 0;
	}

	if (just_started_moving) {
	    // 이동 시작: 대기 중이던 전환/알람 취소 (하지만 당장은 걷기로 바꾸지 않음)
	    anim_lock_until_end = false;
	    alarm[0] = -1;
	}

	// 움직이는 동안
	if (is_moving) {
	    // 임계치 도달하면 그때부터 걷기 애니 시작 (0프레임부터)
	    if (move_frames >= walk_min_frames_to_show) {
	        if (sprite_index != spr_walk) {
	            sprite_index = spr_walk;
	            image_index = 0;   // 걷기 애니 초기화
	        }
	        if (image_speed == 0) image_speed = 1; // 혹시 0프레임 정지 중이었다면 해제
	    } else {
	        // 임계치 미달: 계속 idle 유지
	        if (sprite_index != spr_idle) {
	            sprite_index = spr_idle;
	            image_index = 0;
	        }
	    }
	}
	// 멈췄을 때
	else {
	    // 걷기 중이었으면 사이클 끝까지 재생 후 idle (기존 로직 유지)
	    if (sprite_index == spr_walk) {
	        if (!anim_lock_until_end && image_speed != 0) {
	            anim_lock_until_end = true;
	        }
	        // 사이클 끝나면 Animation End에서 0프레임 정지 + Alarm으로 idle 전환
	    } else {
	        // 이미 idle이면 유지
	        if (sprite_index != spr_idle && !anim_lock_until_end) {
	            sprite_index = spr_idle;
	            image_index = 0;
	            image_speed = 1;
	        }
	    }
	}

	// 다음 스텝을 위한 상태 저장
	was_moving = is_moving;

	// 좌우 바라보기(시각만 반전)
	if (hsp != 0) {
	    image_xscale = sign(hsp);
	}

if (keyboard_check_pressed(vk_space)) {
    var seat = instance_nearest(x, y, ocustomer_sit);
    if (instance_exists(seat) && seat.occupied && point_distance(x,y, seat.x, seat.y) < 48) {
        var held = global.held_item; // 네 프로젝트 변수명에 맞춰 교체
        if (serve_customer_at_seat(seat, held)) {
            // 성공 연출/아이템 소비 등
        } else {
            // 틀린 주문 피드백
        }
    }
}