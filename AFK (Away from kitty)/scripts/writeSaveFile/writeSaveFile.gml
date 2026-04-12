function writeSaveFile(fileName, overwrite = false){
    if(!instance_exists(ObjectPlayer)) {
        show_error("Error while saving: No Player Object found!", false);
        return;
    }
    if(overwrite && file_exists(fileName)) {
        file_delete(fileName);
    }
    ini_open(fileName);
    ini_write_real("POSITION", "current_room", room);
    ini_write_real("POSITION", "plr_x", ObjectPlayer.x);
    ini_write_real("POSITION", "plr_y", ObjectPlayer.y);
    ini_write_string("INFO", "weapon", ObjectPlayer.currentWeapon);
    ini_write_real("INFO", "progress", 0);
    if(ini_section_exists("INVENTORY")) {
        ini_section_delete("INVENTORY");
    }
    ini_write_array("INVENTORY", ObjitemManager.inv);
    ini_close();
}