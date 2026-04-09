event_inherited();

moveSpeed = 3
atk_spd = 8
vsp = 0
hsp = 0
nme_state = state.IDLE

attacked = false

idleMoveTime = game_get_speed(gamespeed_fps) * 1
idleStopTime = game_get_speed(gamespeed_fps) * 1
attackTimer = game_get_speed(gamespeed_fps) * 1
explodeTimer = game_get_speed(gamespeed_fps) * 2

alarm[0] = idleMoveTime
alarm[1] = idleStopTime
alarm[2] = attackTimer
alarm[3] = explodeTimer

setState("STATE_CONTACT_HARM_PLAYER")