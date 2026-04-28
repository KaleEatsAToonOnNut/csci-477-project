/// @description attack timer

if(nme_state == state.ATTACK) {

	if(instance_exists(ObjectPlayer)) {
    	plr = ObjectPlayer
        if(plr.getState("STATE_DEAD")) {
            return;
        }
		var normal = sqrt(power(x - plr.x, 2) + power(y - plr.y, 2))
        spd.x = ((plr.x - x) / normal) * atk_spd;
        spd.y = ((plr.y - y) / normal) * atk_spd;
	}

	attackTime = game_get_speed(gamespeed_fps) * random(2)

	alarm[2] = attackTime
}