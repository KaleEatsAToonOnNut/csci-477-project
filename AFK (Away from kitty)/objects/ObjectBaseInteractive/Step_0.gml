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

if(getState("STATE_PAUSED") || getState("STATE_DEAD")) {
    return;
}

if(hp <= 0) {
    setState("STATE_DEAD");
    event_user(0);
}

if(parent != noone) {
    x = parent.x + parentStats.offset.x;
    y = parent.y + parentStats.offset.y;
    image_angle = parentStats.rOffset;
    if(getState("STATE_PARENT_SCALE")) {
        image_xscale = sign(parent.image_xscale) * abs(image_xscale);
        image_yscale = sign(parent.image_yscale) * abs(image_yscale);
    }
}