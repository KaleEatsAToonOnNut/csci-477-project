event_inherited();

preservedSpd.x = spd.x;
preservedSpd.y = spd.y;

tilemap_id = layer_tilemap_get_id("Collision_Tiles")

// Check if the object is supposed to be frozen
if(getState("STATE_FROZEN")) {
    return;
}

if(knockback.x != 0 || knockback.y != 0) {
    spd.x = knockback.x;
    spd.y = knockback.y;
}

if (place_meeting(x + spd.x, y, tilemap_id)) {
		while (!place_meeting(x + sign(spd.x), y, tilemap_id)) {
			x += sign(spd.x);
		}
		spd.x = 0;
}

if (place_meeting(x, y + spd.y, tilemap_id)) {
		while (!place_meeting(x, y + sign(spd.y), tilemap_id)) {
			y += sign(spd.y);
		}
		spd.y = 0;
}

// Move in the x direction
if (spd.x != 0) {
    x += spd.x
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