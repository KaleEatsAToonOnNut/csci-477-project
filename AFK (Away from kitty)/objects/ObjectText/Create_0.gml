// Inherit the parent event
event_inherited();

function setValue(tSet) {
    return setText(tSet);
}

function setText(tSet) {
    if(locked) {
        return self;
    }
    text = tSet;
    return self;
} 

function setColor(color) {
    if(locked) {
        return self;
    }
    textColor = color;
    return self;
}

function fixTextAlign() {
    if(locked) {
        return self;
    }
    ux -= string_width(text) * fontSize / 2;
    uy -= string_height(text) * fontSize / 2;
    refreshStats();
    return self;
}

function centerX() {
    if(locked) {
        return self;
    }
    if(parent == noone) {
        ux = (parentStats.width / 2);
    } else {
        ux = parent.ux + (parentStats.width / 2);
    }
    refreshStats();
    return self;
}

function centerY() {
    if(locked) {
        return self;
    }
    if(parent == noone) {
        uy = (parentStats.height / 2);
    } else {
        uy = parent.uy + (parentStats.height / 2);
    }
    refreshStats();
    return self;
}

function setFontSize(size) {
    if(locked) {
        return self;
    }
    fontSize = size;
    return self;
}