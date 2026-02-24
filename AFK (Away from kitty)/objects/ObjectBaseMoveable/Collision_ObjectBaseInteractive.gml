// Inherit the parent event
event_inherited();

if(other.getState("STATE_INTERACTION_PUSHABLE")) {
    // Just don't touch it and it should be fine.
    // A bug related to this cost me like 3 hours of my life.
    other.addSpeed(preservedSpd)
}