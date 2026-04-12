if(keyboard_check(ord("E"))) {
    return;
}

if(getState("STATE_SLEEPING") && sprite_index == cat_sleep_v2) {
    sprite_index = cat_wakeup;
    image_index = 0;
}

if(!getState("STATE_LOCK_MOMENTUM") && !getState("STATE_DEAD") && !getState("STATE_SLEEPING")) {
        
    if(keyboard_check(vk_left) || keyboard_check(ord("A"))) {
        spd.x = -moveSpeed;
        image_xscale = -1;
        setState("STATE_MOVING");
        sprite_index = cat_walk;
        directions.x = -1;
    }
    
    if(keyboard_check(vk_right) || keyboard_check(ord("D"))) {
        spd.x = moveSpeed;
        image_xscale = 1;
        setState("STATE_MOVING");
        sprite_index = cat_walk;
        directions.x = 1;
    }
    
    if(keyboard_check(vk_up) || keyboard_check(ord("W"))) {
        spd.y = -moveSpeed;
        setState("STATE_MOVING");
        sprite_index = cat_walk;
        directions.y = -1;
    }
    
    if(keyboard_check(vk_down) || keyboard_check(ord("S"))) {
        spd.y = moveSpeed;
        setState("STATE_MOVING");
        sprite_index = cat_walk;
        directions.y = 1;
    }
    
}