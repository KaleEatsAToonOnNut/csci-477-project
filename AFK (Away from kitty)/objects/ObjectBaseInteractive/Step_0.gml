if(getState("STATE_PAUSED") || getState("STATE_DEAD")) {
    return;
}

if(hp <= 0) {
    setState("STATE_DEAD");
}

if(parent != noone) {
    x = parent.x + parentStats.offset.x;
    y = parent.y + parentStats.offset.y;
    image_angle = parentStats.rOffset;
    if(getState("STATE_PARENT_SCALE")) {
        image_xscale = sign(parent.image_xscale) * abs(image_xscale);
        image_yscale = sign(parent.image_yscale) * abs(image_yscale);
    }
}