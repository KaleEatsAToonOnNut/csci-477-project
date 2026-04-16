event_inherited();

innerRad = 15
middleRad = 500
outerRad = 700

moveSpeed = 3
atk_spd = 8
vsp = 0
hsp = 0
nme_state = state.IDLE

idleMoveTime = game_get_speed(gamespeed_fps) * 1
idleStopTime = game_get_speed(gamespeed_fps) * 1
attackTimer = game_get_speed(gamespeed_fps) * 1

alarm[0] = idleMoveTime
alarm[1] = idleStopTime
alarm[2] = attackTimer

setState("STATE_CONTACT_HARM_PLAYER")