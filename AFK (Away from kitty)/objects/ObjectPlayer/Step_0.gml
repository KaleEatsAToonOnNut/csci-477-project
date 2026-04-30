// Inherit the parent event
event_inherited();

if(getState("STATE_MOVING") && directions.x == 0 && directions.y == 0) {
    removeState("STATE_MOVING");
}

if ((knockback.x != 0 || knockback.y != 0) && play_hit) {
	audio_play_sound(snd_hit, 1, false, 1, 0, random_range(0.5,1))
	play_hit = false
}