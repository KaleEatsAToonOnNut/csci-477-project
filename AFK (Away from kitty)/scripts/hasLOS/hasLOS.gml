function hasLOS(objOne, objTwo, blockers, steps=10){
    if(!instance_exists(objOne) || !instance_exists(objTwo) || !instance_exists(blockers)) {
        return false;
    }
    pos = {
        x: objOne.x,
        y: objOne.y
    }
    diff = {
        x: (objTwo.x - objOne.x) / steps,
        y: (objTwo.y - objOne.y) / steps
    }
    for(i = 0; i < steps; i++) {
        if(place_meeting(pos.x, pos.y, blockers)) {
            return false;
        }
        pos.x += diff.x;
        pos.y += diff.y;
    }
    return true;
}