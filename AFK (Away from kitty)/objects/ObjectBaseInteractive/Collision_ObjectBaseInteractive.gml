if(other == parent) {
    return;
}

if(other.getState("STATE_E_FOR_INTERACTION")) {
    other.readyToInteract.push_back(self);
    return;
}

interaction(other);