children = [];
parent = noone;

parentStats = {
    x: x,
    y: y,
    width: browser_width,
    height: browser_height
};

function addChild(obj) {
    array_push(children, obj);
    obj.parent = self;
    obj.resetToParent();
}

function removeChild(obj) {
    array_delete(children, array_get_index(children, obj), 1);
}

function resetToParent() {
    x = parent.x + parentStats.x;
    y = parent.y + parentStats.y;
    parentStats.width = parent.width;
    parentStats.height = parent.height;
    for(i = 0; i < array_length(children); i++) {
        children[i].resetToParent();
    }
}

function setWidth(unit) {
    width = unitToPixels(unit);
}

function setHeight(unit) {
    height = unitToPixels(unit);
}