// Inherit the parent event
event_inherited();

if(moving) {
    moving = false;
} else {
    sprite_index = cat_idle;
}