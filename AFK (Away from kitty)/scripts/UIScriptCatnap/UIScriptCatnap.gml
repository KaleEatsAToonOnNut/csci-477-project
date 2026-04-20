function UIScriptCatnap(){
    if(instance_exists(ObjectPlayer)) {
        with(ObjectPlayer) {
            setState("STATE_SLEEPING");
            sprite_index = cat_sleep;
            image_index = 0;
            writeSaveFile(saveName, true);
            instance_destroy(ui);
            ui = noone;
        }
    }
    UIScriptResume();
}