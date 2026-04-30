/// @description enemy state system

event_inherited();

// check if player exists
if( instance_exists(ObjectPlayer)) {
	
	plr = ObjectPlayer
	
	// check if player is within range
	
	if( attacked ) {
		//sprite_index = spr_explode40
	} else if(point_distance(plr.x, plr.y, x, y) <= 120 && point_distance(plr.x, plr.y, x, y) > 35) {
		// attack status
		nme_state = state.ATTACK
		
		if(alarm[2] <= 0) {
            removeState("STATE_FORCE_MOMENTUM");
			alarm[2] = attackTimer
			direction = point_direction(plr.x, plr.y, x, y)
		} else if(alarm[2] < attackTimer - 0.3 ){
            setState("STATE_FORCE_MOMENTUM");
			direction = point_direction(plr.x, plr.y, x, y) + 93
		}
		
		//sprite_index = rat_walk
		
	} else if(point_distance(plr.x, plr.y, x, y) <= 35) {
		
		//sprite_index = rat_walk
		
		spd.x = 0
		spd.y = 0
		
	} else if(point_distance(plr.x, plr.y, x, y) < 300 && point_distance(plr.x, plr.y, x, y) > 120) {
		// move towards player		
		nme_state = state.APPROACH
		var normal = sqrt(power(x - plr.x, 2) + power(y - plr.y, 2))
        spd.x = ((plr.x - x) / normal) * moveSpeed;
        spd.y = ((plr.y - y) / normal) * moveSpeed;
		
	} else if((point_distance(plr.x, plr.y, x, y) > 115 && point_distance(plr.x, plr.y, x, y) < 120)) {
		
		//sprite_index = rat_windup
		
		spd.x = 0
		spd.y = 0
		
		if(alarm[2] <= 0) {
            removeState("STATE_FORCE_MOMENTUM");
			alarm[2] = attackTimer
			direction = point_direction(plr.x, plr.y, x, y)
			//spd.x = moveSpeed * cos(degtorad(direction));
            //spd.y = moveSpeed * sin(degtorad(direction));
		} else if(alarm[2] < attackTimer - 0.3 ){
            setState("STATE_FORCE_MOMENTUM");
			direction = point_direction(plr.x, plr.y, x, y) + 93
			//spd.x = moveSpeed * cos(degtorad(direction));
            //spd.y = moveSpeed * sin(degtorad(direction));
		}
	} else {
		
		//sprite_index = rat_idle
		
		if(alarm[0] <= 0) {
			alarm[0] = idleMoveTime
			alarm[1] = idleStopTime
			spd.x = 0;
            spd.y = 0;
		
		// idle away from player
		plr_state = state.IDLE
		}
	}
}

if ((knockback.x != 0 || knockback.y != 0) && play_hit) {
	audio_play_sound(snd_slimehit, 1, false, 1, 0, random_range(0.75,1.25))
	play_hit = false
}