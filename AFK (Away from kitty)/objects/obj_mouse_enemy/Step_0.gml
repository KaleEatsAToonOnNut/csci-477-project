/// @description enemy state system

event_inherited();

// check if player exists
if( instance_exists(ObjectPlayer)) {
	
	plr = ObjectPlayer
    if(plr.getState("STATE_DEAD")) {
        return;
    }
    los = hasLOS(self, plr, layer_tilemap_get_id("Collision_Tiles"))
	
		// middle radius behavior
	if(point_distance(plr.x, plr.y, x, y) <= middleRad && point_distance(plr.x, plr.y, x, y) > innerRad) {
		// attack status
		nme_state = state.ATTACK
		
		sprite_index = rat_walk
		
		// inner radius behavior
	} else if(point_distance(plr.x, plr.y, x, y) <= innerRad) {
		
		sprite_index = rat_walk
		
		direction = point_direction(plr.x, plr.y, x, y)
			spd.x = moveSpeed * cos(degtorad(direction));
            spd.y = moveSpeed * sin(degtorad(direction));
		
		// outer radius behavior
	} else if(point_distance(plr.x, plr.y, x, y) < outerRad && point_distance(plr.x, plr.y, x, y) > middleRad + 3) {
		
		sprite_index = rat_idle
		
		// move towards player		
		nme_state = state.APPROACH
		var normal = sqrt(power(x - plr.x, 2) + power(y - plr.y, 2))
        spd.x = ((plr.x - x) / normal) * moveSpeed;
        spd.y = ((plr.y - y) / normal) * moveSpeed;
		
		// outside radius bahavior
	} else if((point_distance(plr.x, plr.y, x, y) > middleRad - 2 && point_distance(plr.x, plr.y, x, y) < middleRad + 3)) {
		
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
			
			// these lines make the ai very jittery so prob don't use them lol
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

if ((knockback.x != 0 || knockback.y != 0) && play_hit) {
	audio_play_sound(snd_hit, 1, false, 1, 0, random_range(1,1.5))
	play_hit = false
}

if getState("STATE_DEAD") 
	audio_play_sound(snd_mousedie, 1, false, 1, 0, random_range(0.75, 1.25))