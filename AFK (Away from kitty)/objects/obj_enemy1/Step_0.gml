/// @description enemy state system

event_inherited();

// check if player exists
if( instance_exists(ObjectPlayer)) {
	
	plr = ObjectPlayer
	
	// check if player is within range
	if(point_distance(plr.x, plr.y, x, y) <= 120 && point_distance(plr.x, plr.y, x, y) > 35) {
		// attack status
		nme_state = state.ATTACK
		
		if(alarm[2] <= 0) {
            removeState("STATE_FORCE_MOMENTUM");
			alarm[2] = attackTimer
			direction = point_direction(plr.x, plr.y, x, y)
			spd.x = moveSpeed * cos(degtorad(direction));
            spd.y = moveSpeed * sin(degtorad(direction));
		} else if(alarm[2] < attackTimer - 0.3 ){
            setState("STATE_FORCE_MOMENTUM");
			direction = point_direction(plr.x, plr.y, x, y) + 93
			spd.x = moveSpeed * cos(degtorad(direction));
            spd.y = moveSpeed * sin(degtorad(direction));
		}
		
	} else if(point_distance(plr.x, plr.y, x, y) <= 35) {
		
		direction = point_direction(plr.x, plr.y, x, y)
			spd.x = moveSpeed * cos(degtorad(direction));
            spd.y = moveSpeed * sin(degtorad(direction));
		
	} else if(point_distance(plr.x, plr.y, x, y) < 300 && point_distance(plr.x, plr.y, x, y) > 100) {
		// move towards player		
		nme_state = state.APPROACH
		var normal = sqrt(power(x - plr.x, 2) + power(y - plr.y, 2))
        spd.x = ((plr.x - x) / normal) * moveSpeed;
        spd.y = ((plr.y - y) / normal) * moveSpeed;
		
	} else {
		
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