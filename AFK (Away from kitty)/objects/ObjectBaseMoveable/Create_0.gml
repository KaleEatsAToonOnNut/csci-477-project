// The base moveable object, meant to be the parent of anything that can move.
// Defines behavior for movement, object states, and interaction.

// Inherit the parent event
event_inherited();

// States any moveable object can be in, builds upon the stateList defined in ObjectBaseInteractive
// Freezes the object from moving
addToStateList("STATE_FROZEN");
// Makes the object invulnerable
addToStateList("STATE_INVULNERABLE");
// The object will not zero its momentum after a move step
addToStateList("STATE_FORCE_MOMENTUM");
// Do not collide with entities physically
addToStateList("STATE_NO_COLLIDE");
// Do not collide with walls physically
addToStateList("STATE_NO_WALL_COLLIDE");
// Only stop movements when aligned with a tile
addToStateList("STATE_TILE_BASED_MOVEMENT");

// Manage the speed of the object
spd = {
  x: 0,
  y: 0  
};

// Last speed of the object
// Used for events where speed needs to be referenced externally because of GM2's event preference
preservedSpd = {
    x: 0,
    y: 0
};


function addSpeed(otherSpeed) {
    spd.x += otherSpeed.x;
    spd.y += otherSpeed.y;
}

// Manage current state. Whether the entity can interact, move, etc.
currentState = 0;

// Set a state in the stateList bitmask
function setState(stateToCheck) {
    currentState |= stateToCheck;
}

// Remove a state in the stateList bitmask
function removeState(stateToCheck) {
    currentState = currentState & (~stateToCheck);
}

// Check if a state is applied
function getState(stateToCheck) {
    if(currentState & stateToCheck) {
        return true;
    }
    return false;
}