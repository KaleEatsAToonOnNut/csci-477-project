function readSaveFile(params){
    if(!instance_exists(ObjectPlayer)) {
        show_error("Error while reading: No Player Object found!", false);
        return;
    }
    
    ini_open(params[0]);
    var currRoom = ini_read_real("POSITION", "current_room", room);
    room_goto(currRoom);
    ObjectPlayer.x = ini_read_real("POSITION", "plr_x", ObjectPlayer.x);
    ObjectPlayer.y = ini_read_real("POSITION", "plr_y", ObjectPlayer.y);
    ObjectPlayer.currentWeapon = ini_read_string("INFO", "weapon", ObjectPlayer.currentWeapon);
    ObjectPlayer.hp = 100;
    ObjectPlayer.removeState("STATE_DEAD");
    
    if(!instance_exists(ObjitemManager)) { 
        show_error("Warning while reading: No Item Manager Object found!", false);
        ini_close();
        return;
    }
    
    var tempInvArray = ini_read_array("INVENTORY");
    ObjitemManager.inv = tempInvArray;
    ini_close();
}