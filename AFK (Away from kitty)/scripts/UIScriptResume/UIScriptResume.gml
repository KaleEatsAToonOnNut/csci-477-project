function UIScriptResume(){
    with(all) {
        if(variable_instance_exists(self, "removeState")) { 
            removeState("STATE_PAUSED");
            removeState("STATE_FROZEN");
        }
        if(object_index == ObjectPlayer) {
            instance_destroy(ui);
            ui = noone;
        }
    }
}