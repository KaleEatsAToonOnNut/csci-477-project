if(!getState("STATE_LOCK_MOMENTUM")) {
    spd.y = -moveSpeed;
    moving = true;
    sprite_index = cat_walk;
}