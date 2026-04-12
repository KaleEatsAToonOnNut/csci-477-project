/// @description attack timer

if(nme_state == state.ATTACK) {

	if(instance_exists(ObjectPlayer) && !attacked) {
		
		attacked = true
		
		plr = ObjectPlayer
		var normal = sqrt(power(x - plr.x, 2) + power(y - plr.y, 2))
        spd.x = ((plr.x - x) / normal) * atk_spd;
        spd.y = ((plr.y - y) / normal) * atk_spd;
		
	}

	explodes = true;
	explodeTimer = game_get_speed(gamespeed_fps) * 1.2
	show_debug_message(explodeTimer);
	alarm[3] = explodeTimer
}