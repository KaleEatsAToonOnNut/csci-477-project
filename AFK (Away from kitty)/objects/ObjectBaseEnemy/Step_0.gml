// Inherit the parent event
event_inherited();

if(hasLOS(self, ObjectPlayer, tilemap_id)) {
    canSeePlayer = true;
} else {
    canSeePlayer = false;
}