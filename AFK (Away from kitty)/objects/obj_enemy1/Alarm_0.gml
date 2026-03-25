/// @description idle move timer

if(plr_state == state.IDLE) {

	move_towards_point(random(display_get_width()), random(display_get_height()), moveSpeed)

	idleMoveTime = game_get_speed(gamespeed_fps) * random(1) * 6

	alarm[0] = idleMoveTime

}