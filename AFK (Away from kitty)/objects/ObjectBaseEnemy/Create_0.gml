// Inherit the parent event
event_inherited();

moveSpeed = 4;

pathingList = {
    // Do nothing
    PATH_STATE_NOTHING: 1,
    // Path straight to the player
    PATH_STATE_PLAYER: 2,
    // Path to the player using an algorithm
    PATH_STATE_PLAYER_SMART: 3,
    // Move around randomly
    PATH_STATE_RANDOM: 4
};

// Set the enemy to do nothing
currentPathState = pathingList.PATH_STATE_NOTHING;

