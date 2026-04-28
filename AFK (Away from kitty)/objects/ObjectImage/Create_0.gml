event_inherited();

defXScale = 1.0;
defYScale = 1.0;


function setValue(val) {
    return setImage(val);
}

function setImage(val) {
    if(locked) {
        return self;
    }
    currImg = val;
    defXScale = sprite_get_width(currImg);
    defYScale = sprite_get_height(currImg);
    return self;
}

function setColor(col) {
    if(locked) {
        return self;
    }
    imgColor = col;
    return self;
}