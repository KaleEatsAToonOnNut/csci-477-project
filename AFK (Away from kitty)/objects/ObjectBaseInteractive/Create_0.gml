stateList = {
    // Mandates the other must press E to interact
    STATE_E_FOR_INTERACTION: 1,
    // Sets the object to trigger a callback function when interacted with
    STATE_INTERACTION_CALLBACK: 2,
    // Makes the object invulnerable
    STATE_INVULNERABLE: 4
};

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

function damage(value) {
    if(!getState(stateList.STATE_INVULNERABLE)) {
        hp -= value;
        if(hp < 0) {
            hp = 0;
        }
    }
    if(hp == 0) {
        instance_destroy(self);
    }
}

// Handle interactions
function interaction(other) {
    
    if(other.getState("STATE_INTERACTION_CALLBACK") && other.alarm[0] <= 0) {
        if(other.callbackTimer > 0) {
            show_debug_message(other.callbackTimer);
            other.alarm[0] = other.callbackTimer;
        } else {
            with (other) {
                event_user(0);
            }
        }
    }
}

readyToInteract = [];

function checkInteractionList(object) {
    if(readyToInteract.array_contains(object)) {
        return true;
    }
    return false;
}