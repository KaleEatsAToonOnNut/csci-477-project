// Inherit the parent event
event_inherited();

if(getState("STATE_MOVING") && directions.x == 0 && directions.y == 0) {
    removeState("STATE_MOVING");
} else if(!getState("STATE_MOVING")) {
    sprite_index = cat_idle;
}