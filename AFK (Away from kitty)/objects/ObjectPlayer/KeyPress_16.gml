alarm[1] = dashTiming;
dashing = true;
setState("STATE_LOCK_MOMENTUM");
spd.x = dashSpeed * cos(dashDirection);
spd.y = dashSpeed * sin(dashDirection);