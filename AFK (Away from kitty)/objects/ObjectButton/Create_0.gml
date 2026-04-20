// Inherit the parent event
event_inherited();

function setCallback(fnc) {
    callback = fnc;
    return self;
}