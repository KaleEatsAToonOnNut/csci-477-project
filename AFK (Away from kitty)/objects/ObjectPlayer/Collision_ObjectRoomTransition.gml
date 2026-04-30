if(getState("STATE_DEAD")) {
    return;
}

if(other.roomTo != noone && other.enabled) {
    ptpid = other.tpid;
    removeState("STATE_ATTACKING");
	room_goto(other.roomTo);
}