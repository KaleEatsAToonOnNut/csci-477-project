// The base static object, meant to be the parent of anything that can be interacted with but can't move.
// Defines behavior for object states and interaction.

// Inherit the parent event
event_inherited();

function addSpeed(toAdd) {
    // This does nothing for this object as it is static
    return;
}

// Manage current state
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