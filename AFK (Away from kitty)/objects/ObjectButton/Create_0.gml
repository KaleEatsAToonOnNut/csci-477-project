// Inherit the parent event
event_inherited();

params = [];

function setCallback(fnc) {
    if(locked) {
        return self;
    }
    callback = fnc;
    return self;
}

function setParams(p) {
    if(locked) {
        return self;
    }
    array_copy(params, 0, p, 0, array_length(p));
    show_debug_message(params);
    return self;
}

function isSelectable(value) {
    if(locked) {
        return self;
    }
    selectable = value;
    return self;
}