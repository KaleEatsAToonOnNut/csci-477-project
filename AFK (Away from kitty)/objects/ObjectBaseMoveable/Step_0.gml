preservedSpd.x = spd.x;
preservedSpd.y = spd.y;

// Check if the object is supposed to be frozen
if(getState("STATE_FROZEN")) {
    return;
}

// Move in the x direction
if(spd.x != 0) {
    x += spd.x;
    // Clear momentum after
    if(!getState("STATE_FORCE_MOMENTUM") && !getState("STATE_LOCK_MOMENTUM")) {
        spd.x = 0;
    }
}
// Move in the y direction
if(spd.y != 0) {
    y += spd.y
    // Clear momentum after
    if(!getState("STATE_FORCE_MOMENTUM") && !getState("STATE_LOCK_MOMENTUM")) {
        spd.y = 0;
    }
}