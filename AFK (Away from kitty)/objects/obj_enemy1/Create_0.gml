hp = 3
moveSpeed = 3
atk_spd = 8
vsp = 0
hsp = 0
plr_state = state.IDLE

enum state {
	ATTACK,
	IDLE,
	SURROUND,
	APPROACH
}

idleMoveTime = game_get_speed(gamespeed_fps) * 1
idleStopTime = game_get_speed(gamespeed_fps) * 1
attackTimer = game_get_speed(gamespeed_fps) * 1

alarm[0] = idleMoveTime
alarm[1] = idleStopTime
alarm[2] = attackTimer