/// @description enemy state system

// check if player exists
if( instance_exists(ObjectPlayer)) {
	
	plr = ObjectPlayer
	
	// check if player is within range
	if(point_distance(plr.x, plr.y, x, y) <= 120 && point_distance(plr.x, plr.y, x, y) > 40) {
		// attack status
		plr_state = state.ATTACK
		
		if(alarm[2] <= 0) {
			alarm[2] = attackTimer
			direction = point_direction(plr.x, plr.y, x, y)
			speed = moveSpeed
		} else if(alarm[2] < attackTimer - 0.2 ){
			direction = point_direction(plr.x, plr.y, x, y) + 93
			speed = moveSpeed
		}
		
	} else if(point_distance(plr.x, plr.y, x, y) <=25) {
		
		direction = point_direction(plr.x, plr.y, x, y)
		speed = moveSpeed
		
	} else if(point_distance(plr.x, plr.y, x, y) < 300 && point_distance(plr.x, plr.y, x, y) > 100) {
		// move towards player		
		plr_state = state.APPROACH
		move_towards_point(plr.x, plr.y, moveSpeed)
		
	} else {
		
		if(alarm[0] <= 0) {
			alarm[0] = idleMoveTime
			alarm[1] = idleStopTime
			speed = 0
		
		// idle away from player
		plr_state = state.IDLE
		}
	}
}