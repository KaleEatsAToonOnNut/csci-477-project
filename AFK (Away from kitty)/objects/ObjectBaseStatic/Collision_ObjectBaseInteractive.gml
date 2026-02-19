if(other.getState(other.stateList.STATE_E_FOR_INTERACTION)) {
    return;
}

if(other.getState(other.stateList.STATE_INTERACTION_PUSHABLE)) {
    other.addSpeed(spd);
}

if(other.getState(other.stateList.STATE_INTERACTION_CALLBACK)) {
    if(callbackTimer > 0) {
        other.alarm[0] = callbackTimer;
    } else {
        other.event_user(0);
    }
}