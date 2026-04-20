// Inherit the parent event
event_inherited();

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