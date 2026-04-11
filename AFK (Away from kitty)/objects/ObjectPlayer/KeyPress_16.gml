if(stamina - 30 < 0 || getState("STATE_DEAD")) {
    return;
}

if(directions.x == 0 && directions.y == 0) {
    directions.x = sign(image_xscale);
}

stamina -= 30;
alarm[1] = dashTiming;
setState("STATE_DASHING");
image_alpha = 0.5;
setState("STATE_LOCK_MOMENTUM");
setState("STATE_INVULNERABLE");
spd.x = dashSpeed * directions.x;
spd.y = dashSpeed * directions.y;

if(!getState("STATE_MOVING")) {
    directions.x = 0;
    directions.y = 0;
}
