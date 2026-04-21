// Inherit the parent event
event_inherited();

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

function evaluateParams(p, j) {
    var out = [];
    
    for(var i = 0; i < array_length(p); i++) {
        switch(p[i]){
            case "CURRENT_INDEX":
                array_push(out, j);
                break;
            case "CURSOR_INDEX":
                array_push(out, cursor);
                break;
            default:
                array_push(out, p);
                break;
        }
    }
    return out;
}

function addChildrenFromArray(val, mapping = UIScriptMatrixDefaultMapping()) {
    if(typeof(val) != "array") {
        return self;
    }
    for(var j = 0; j < array_length(val); j++) {
        var built = evaluateParams(mapping.params, j);
        
        var temp = createNewChild(ObjectButton)
            .setWidth(mapping.width)
            .setHeight(mapping.height)
            .setCallback(val[j][$ mapping.map])
            .setParams(built);
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