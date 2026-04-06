if(stamina - 30 < 0) {
    return;
}

if(directions.x == 0 && directions.y == 0) {
    directions.x = sign(image_xscale);
}

stamina -= 30;
alarm[1] = dashTiming;
dashing = true;
image_alpha = 0.5;
setState("STATE_LOCK_MOMENTUM");
setState("STATE_INVULNERABLE");
spd.x = dashSpeed * directions.x;
spd.y = dashSpeed * directions.y;

if(!moving) {
    directions.x = 0;
    directions.y = 0;
}
