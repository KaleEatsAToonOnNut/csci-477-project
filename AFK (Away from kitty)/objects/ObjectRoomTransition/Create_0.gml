// Visible only in the editor
visible = false;

if(instance_exists(ObjectPlayer)) {
    if(ObjectPlayer.ptpid == tpid && ObjectPlayer.ptpid != 0) {
        ObjectPlayer.x = x + (cos(degtorad(dir)) * 64);
        ObjectPlayer.y = y + (sin(degtorad(dir)) * 64);
        ObjectPlayer.ptpid = 0;
    } 
}