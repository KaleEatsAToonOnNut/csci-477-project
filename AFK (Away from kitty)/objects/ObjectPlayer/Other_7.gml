image_index = 0;
if(sprite_index == cat_sleep) {
    sprite_index = cat_sleep_v2;
}
if(sprite_index == cat_walk && !getState("STATE_MOVING") && !getState("STATE_SLEEPING") && !getState("STATE_DEAD")) {
    sprite_index = cat_idle;
}
if(sprite_index == cat_wakeup) {
    removeState("STATE_SLEEPING");
    sprite_index = cat_idle;
}