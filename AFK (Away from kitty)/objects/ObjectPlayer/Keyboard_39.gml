if(!getState("STATE_LOCK_MOMENTUM")) {
    spd.x = moveSpeed;
    image_xscale = 1;
    moving = true;
    sprite_index = cat_walk;
}