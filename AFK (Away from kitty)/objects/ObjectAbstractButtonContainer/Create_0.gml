// Inherit the parent event
event_inherited();

ux = parentStats.x;
uy = parentStats.y; 

resetToParent();

cursor = 0;

function progressCursor(amount) {
    if(array_length(children) == 0) { 
        return;
    }
    children[cursor].outline = c_gray;
    cursor += amount;
    cursor %= array_length(children);
    while(cursor < 0) {
        cursor += array_length(children);
    }
    children[cursor].outline = c_red;
}

function ifEmpty() {
    if(array_length(children) > 0) {
        lock();
    }
    return self;
}

function ifNotEmpty() {
    if(array_length(children) == 0) {
        lock();
    }
    return self;
}

function endIf() {
    unlock();
    return self;
}