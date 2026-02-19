// Inherit the parent event
event_inherited();

pathingList = {
    // Do nothing
    PATH_STATE_NOTHING: 1,
    // Path straight to the player
    PATH_STATE_PLAYER: 2,
    // Move around randomly
    PATH_STATE_RANDOM: 3
};

// Set the enemy to do nothing
currentPathState = pathingList.PATH_STATE_NOTHING;

