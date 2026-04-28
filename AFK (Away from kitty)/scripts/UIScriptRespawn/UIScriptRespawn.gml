function UIScriptRespawn(){
    if(instance_exists(ObjectPlayer)) {
        with(ObjectPlayer) {
            sprite_index = cat_sleep_v2;
            image_index = 0;
            removeState("STATE_DEAD");
            setState("STATE_SLEEPING");
            readSaveFile([saveName]);
        }
    }
}