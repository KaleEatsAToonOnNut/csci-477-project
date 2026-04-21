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

function setRows(count) {
    rowCount = count;
    return self;
}

function formatCells() {
    for(var i = 0; i < array_length(children); i++) {
        with(children[i]) {
            ux = parent.ux + (parentStats.width / (2 * other.rowCount)) + (parentStats.width / other.rowCount) * floor(i / other.rowCount) - (width / 2);
            uy = parent.uy + (parentStats.height / (2 * other.rowCount)) + (parentStats.height / other.rowCount) * floor(i % other.rowCount) - (height / 2);
            refreshStats();
        }
    }
    return self;
}

function addChildrenFromArray(val, mapping = UIScriptMatrixDefaultMapping()) {
    if(typeof(val) != "array") {
        return self;
    }
    for(var j = 0; j < array_length(val); j++) {
        var temp = createNewChild(ObjectButton)
            .setWidth(mapping.width)
            .setHeight(mapping.height)
            .setCallback(val[j][$ mapping.map]);
        for(var i = 0; i < array_length(mapping.children); i++) {
            temp.createNewChild(mapping.children[i].obj)
                .setWidth(mapping.children[i].width)
                .setHeight(mapping.children[i].height)
                .setX(mapping.children[i].ux)
                .setY(mapping.children[i].uy)
                .setValue(val[j][$ mapping.children[i].map])
        }
        
        
    }
    return self;
}