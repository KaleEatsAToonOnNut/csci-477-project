stateList = {
    // Makes the object invulnerable
    STATE_INVULNERABLE: 1,
    // Tells other objects to not interact with this object
    STATE_DEAD: 2,
    // Custom definition, should be used when you don't want attack events to happen
    STATE_NO_ATTACK: 4,
    // Pauses everything.
    STATE_PAUSED: 8,
    // Makes it so that the scale of this sprite adheres to the scale of the parent
    STATE_PARENT_SCALE: 16
};

parentStats = {
    offset: {
        x: 0,
        y: 0
    },
    rOffset: 0
};

if(parent != noone) {
    parentStats = {
        offset: {
            x: x - parent.x,
            y: y - parent.y
        },
        rOffset: image_angle - parent.image_angle
    }      
}


// Function to automatically add a state to the stateList bitmask
function addToStateList(stateName) {
    variable_struct_set(stateList, stateName, power(2, variable_struct_names_count(stateList) + 1));
}

// Manage current state. Whether the entity can interact, move, etc.
currentState = 0;

// Set a state in the stateList bitmask
function setState(stateToCheck) {
    if(variable_struct_exists(stateList, stateToCheck)) {
        currentState |= variable_struct_get(stateList, stateToCheck);
    }
}

// Remove a state in the stateList bitmask
function removeState(stateToCheck) {
    if(variable_struct_exists(stateList, stateToCheck)) {
        currentState = currentState & (~variable_struct_get(stateList, stateToCheck));
    }
}

// Check if a state is applied
function getState(stateToCheck) {
    if(variable_struct_exists(stateList, stateToCheck)) {
        if(currentState & variable_struct_get(stateList, stateToCheck)) {
            return true;
        }
    }
    return false;
}

// Flip a state
function flipState(stateToCheck) {
    if(getState(stateToCheck)) {
        removeState(stateToCheck);
    } else {
        setState(stateToCheck);
    }
}