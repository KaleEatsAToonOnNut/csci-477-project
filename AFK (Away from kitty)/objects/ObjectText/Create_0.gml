// Inherit the parent event
event_inherited();

function setValue(tSet) {
    return setText(tSet);
}

function setText(tSet) {
    text = tSet;
    return self;
} 

function setColor(color) {
    textColor = color;
    return self;
}

function fixTextAlign() {
    ux -= string_width(text) / 2;
    refreshStats();
    return self;
}

function centerX() {
    if(parent == noone) {
        ux = (parentStats.width / 2);
    } else {
        ux = parent.ux + (parentStats.width / 2);
    }
    refreshStats();
    return self;
}

function centerY() {
    if(parent == noone) {
        uy = (parentStats.height / 2);
    } else {
        uy = parent.uy + (parentStats.height / 2);
    }
    refreshStats();
    return self;
}