children = [];
depth = 255;
background = noone;
locked = false;
phantom = false;

parentStats = {
    x: ux,
    y: uy,
    width: browser_width,
    height: browser_height
};

function setValue(val) {
    // Abstract for when we're not sure if we can set specific values.
    return self;
}

function addChild(obj) {
    if(locked) {
        return self;
    }
    array_push(children, obj);
    with(obj) {
        parent = other;
        depth = other.depth - 1;
    }
    resetToParent();
    return self;
}

function removeChild(obj) {
    if(locked) {
        return self;
    }
    if(array_get_index(children, obj) != -1) {
        array_delete(children, array_get_index(children, obj), 1);
    }
    return self;
}

function resetToParent() {
    if(locked) {
        return;
    }
    if(parent == noone) {
        parentStats.width = browser_width;
        parentStats.height = browser_height;
    } else {
        ux = parent.ux + parentStats.x;
        uy = parent.uy + parentStats.y;
        parentStats.width = parent.width;
        parentStats.height = parent.height;
    }
    for(i = 0; i < array_length(children); i++) {
        with(children[i]) {
            resetToParent();
        }
    }
}

function refreshStats() {
    if(parent == noone || locked) {
        return;
    }
    parentStats.x = ux - parent.ux;
    parentStats.y = uy - parent.uy;
    resetToParent();
}

function centerX() {
    if(locked) {
        return self;
    }
    if(parent == noone) {
        ux = (parentStats.width / 2) - (width / 2);
    } else {
        ux = parent.ux + (parentStats.width / 2) - (width / 2);
    }
    refreshStats();
    return self;
}

function centerY() {
    if(locked) {
        return self;
    }
    if(parent == noone) {
        uy = (parentStats.height / 2) - (height / 2);
    } else {
        uy = parent.uy + (parentStats.height / 2) - (height / 2);
    }
    refreshStats();
    return self;
}

function setX(unit) {
    if(locked) {
        return self;
    }
    if(parent == noone) {
        ux = unitToPixels(unit);
    } else {
        ux = unitToPixels(unit) + parent.ux;
    }
    refreshStats();
    return self;
}

function setY(unit) {
    if(locked) {
        return self;
    }
    if(parent == noone) {
        uy = unitToPixels(unit);
    } else {
        uy = unitToPixels(unit) + parent.uy;
    }
    refreshStats();
    return self;
}

function setWidth(unit) {
    if(locked) {
        return self;
    }
    width = unitToPixels(unit);
    return self;
}

function setHeight(unit) {
    if(locked) {
        return self;
    }
    height = unitToPixels(unit);
    return self;
}

function createNewChild(type) {
    array_push(children, instance_create_layer(0, 0, "Instances", type));
    var temp = array_last(children);
    with(temp) {
        parent = other;
        depth = other.depth - 1;
        width = other.width;
        height = other.height;
        if(other.locked) {
            locked = true;
            phantom = true;
        }
    }
    resetToParent();
    return temp;
}

function getHead() {
    if(parent == noone) {
        return self;
    }
    if(phantom) {
        array_delete(parent.children, array_get_index(parent.children, self), 1);
        instance_destroy(self);
    }
    return parent.getHead();
}

function getParent() {
    if(parent == noone) {
        return self;
    }
    if(phantom) {
        array_delete(parent.children, array_find_index(parent.children, self), 1);
        instance_destroy(self);
    }
    return parent;
}

function isMouseOver() {
    var mx = (mouse_x - camera_get_view_x(view_camera[0])) * (browser_width / camera_get_view_width(view_camera[0]));
    var my = (mouse_y - camera_get_view_y(view_camera[0])) * (browser_height / camera_get_view_height(view_camera[0]));
    return mx >= ux &&
           mx <= ux + width &&
           my >= uy &&
           my <= uy + height;
}

function countOf(type, out = 0) {
    for(var i = 0; i < array_length(children); i++) {
        return out + children[i].countOf(type);
    }
    if(object_index == type) {
        return 1;
    }
}

function setBackground(spr) { 
    if(locked) {
        return self;
    }
    background = spr;
    backX = sprite_get_width(background);
    backY = sprite_get_height(background);
    return self;
}

function lock() {
    locked = true;
    return self;
}

function unlock() {
    locked = false;
    return self;
}