stateList = {
    // Mandates the other must press E to interact
    STATE_E_FOR_INTERACTION: 1,
    // Sets the object to be pushed when interacted with
    STATE_INTERACTION_PUSHABLE: 2,
    // Sets the object to trigger a callback function when interacted with
    STATE_INTERACTION_CALLBACK: 4,
};

// Function to automatically add a state to the stateList bitmask
function addToStateList(stateName) {
    variable_struct_set(stateList, stateName, power(2, variable_struct_names_count(stateList) + 1));
}