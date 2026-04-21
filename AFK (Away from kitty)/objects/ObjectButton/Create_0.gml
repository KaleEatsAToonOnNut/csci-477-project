// Inherit the parent event
event_inherited();

function setCallback(fnc) {
    callback = fnc;
    return self;
}

function isSelectable(value) {
    selectable = value;
    return self;
}