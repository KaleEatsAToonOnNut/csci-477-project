/// @description enemy state system

event_inherited();

// check if player exists
if( instance_exists(ObjectPlayer)) {
	
	plr = ObjectPlayer
    if(plr.getState("STATE_DEAD")) {
        return;
    }
    los = hasLOS(self, plr, layer_tilemap_get_id("Collision_Tiles"))
	
	// check if player is within range
	if(point_distance(plr.x, plr.y, x, y) <= 117 && point_distance(plr.x, plr.y, x, y) > 30) {
		// attack status
		nme_state = state.ATTACK
		
		sprite_index = rat_walk
		
	} else if(point_distance(plr.x, plr.y, x, y) <= 30) {
		
		sprite_index = rat_walk
		
		direction = point_direction(plr.x, plr.y, x, y)
			spd.x = moveSpeed * cos(degtorad(direction));
            spd.y = moveSpeed * sin(degtorad(direction));
		
	} else if(point_distance(plr.x, plr.y, x, y) < 300 && point_distance(plr.x, plr.y, x, y) > 120) {
		
		sprite_index = rat_idle
		
		// move towards player		
		nme_state = state.APPROACH
		var normal = sqrt(power(x - plr.x, 2) + power(y - plr.y, 2))
        spd.x = ((plr.x - x) / normal) * moveSpeed;
        spd.y = ((plr.y - y) / normal) * moveSpeed;
		
	} else if((point_distance(plr.x, plr.y, x, y) > 115 && point_distance(plr.x, plr.y, x, y) < 120)) {
		
		sprite_index = rat_windup
		
		spd.x = 0
		spd.y = 0
		
		if(alarm[2] <= 0) {
            removeState("STATE_FORCE_MOMENTUM");
			alarm[2] = attackTimer
			direction = point_direction(plr.x, plr.y, x, y)
			//spd.x = moveSpeed * cos(degtorad(direction));
            //spd.y = moveSpeed * sin(degtorad(direction));
		} else if(alarm[2] < attackTimer - 0.4 ){
            setState("STATE_FORCE_MOMENTUM");
			direction = point_direction(plr.x, plr.y, x, y) + 93
			//spd.x = moveSpeed * cos(degtorad(direction));
            //spd.y = moveSpeed * sin(degtorad(direction));
		}
	} else {
		
		sprite_index = rat_idle
		
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