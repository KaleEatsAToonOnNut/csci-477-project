// Inherit the parent event
event_inherited();

if(currentPathState == pathingList.PATH_STATE_PLAYER) {
    if(instance_exists(ObjectPlayer)) {
        // Truly some very complex code
        move_towards_point(ObjectPlayer.x, ObjectPlayer.y, 1);   
    }
}