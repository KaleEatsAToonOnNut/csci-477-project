/// @description idle stop timer

if(nme_state == state.IDLE) {
	
	spd.x = 0;
    spd.y = 0;

	alarm[1] = idleStopTime
}