/// @description attack timer

if(plr_state == state.ATTACK) {

	if(object_exists(ObjectPlayer)) {
		plr = ObjectPlayer
		move_towards_point(plr.x, plr.y, atk_spd)
	}

	attackTime = game_get_speed(gamespeed_fps) * random(2)

	alarm[2] = attackTime
}