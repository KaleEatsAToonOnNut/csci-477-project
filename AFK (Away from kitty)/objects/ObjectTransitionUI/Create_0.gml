// Inherit the parent event
event_inherited();

params = [];
timing = 1.0

function setTiming(timev) {
    if(locked) {
        return self;
    }
    timing = timev;
    alarm[0] = timev;
    return self;
}

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
    return self;
}

opacity = 0;
alarm[0] = timing;