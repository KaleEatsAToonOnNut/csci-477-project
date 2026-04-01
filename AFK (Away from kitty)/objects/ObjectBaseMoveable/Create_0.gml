// The base moveable object, meant to be the parent of anything that can move.
// Defines behavior for movement, object states, and interaction.

// Inherit the parent event
event_inherited();

// States any moveable object can be in, builds upon the stateList defined in ObjectBaseInteractive
// Sets the object to be pushed when interacted with
addToStateList("STATE_INTERACTION_PUSHABLE");
// Freezes the object from moving
addToStateList("STATE_FROZEN");
// The object will not zero its momentum after a move step
addToStateList("STATE_FORCE_MOMENTUM");
// Do not collide with entities physically
addToStateList("STATE_NO_COLLIDE");
// Do not collide with walls physically
addToStateList("STATE_NO_WALL_COLLIDE");
// Lock the object's momentum
addToStateList("STATE_LOCK_MOMENTUM");

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

// Amount of knockback taken
knockback = {
    x: 0,
    y: 0
}

knockbackTiming = 20 * (1 - knockResistance);

// Add speed to this object
function addSpeed(otherSpeed) {
    spd.x += otherSpeed.x;
    spd.y += otherSpeed.y;
}


function applyKnockback(strength, direction) {
    knockback.x = strength * cos(direction) * (1 - knockResistance);
    knockback.y = strength * sin(direction) * (1 - knockResistance);
    if(alarm[11] == -1) {
        alarm[11] = knockbackTiming;
        image_alpha = 0.5;
        setState("STATE_INVULNERABLE");
        setState("STATE_NO_ATTACK");
    }
}