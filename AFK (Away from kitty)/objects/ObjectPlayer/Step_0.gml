// Inherit the parent event
event_inherited();

if(moving && directions.x == 0 && directions.y == 0) {
    moving = false;
} else if(!moving) {
    sprite_index = cat_idle;
}