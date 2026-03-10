// Inherit the parent event
event_inherited();

switch(currentPathState) {
    case pathingList.PATH_STATE_NOTHING:
        break;
    case pathingList.PATH_STATE_PLAYER:
        if(instance_exists(ObjectPlayer)) {
            // Truly some very complex code
            move_towards_point(ObjectPlayer.x, ObjectPlayer.y, 1);   
        }
        break;
    case pathingList.PATH_STATE_PLAYER_SMART:
        if(instance_exists(ObjectPlayer)) {
            mp_linear_step_object(ObjectPlayer.x, ObjectPlayer.y, moveSpeed, all);
        }
        break;
    case pathingList.PATH_STATE_RANDOM:
        
        break;
}