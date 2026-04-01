/// @description idle move timer

if(plr_state == state.IDLE) {

    var rX = random(display_get_width());
    var rY = random(display_get_height());
    var normal = sqrt(power(rX, 2) + power(rY, 2));
    spd.x = (rX / normal) * moveSpeed;
    spd.y = (rY / normal) * moveSpeed;

	idleMoveTime = game_get_speed(gamespeed_fps) * random(1) * 6

	alarm[0] = idleMoveTime

}