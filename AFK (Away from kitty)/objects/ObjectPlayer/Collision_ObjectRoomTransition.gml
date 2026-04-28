if(other.roomTo != noone && other.enabled) {
    ptpid = other.tpid;
    io_clear();
    removeState("STATE_ATTACKING");
	room_goto(other.roomTo);
}