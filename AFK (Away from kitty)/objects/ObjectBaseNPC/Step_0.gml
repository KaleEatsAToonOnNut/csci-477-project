// Inherit the parent event
event_inherited();

if(instance_exists(ObjectPlayer)) {
    if(distance_to_object(ObjectPlayer) > 15.0) {
        removeState("STATE_INDISTANCE");
        removeState("STATE_TALKING");
    } else {
        setState("STATE_INDISTANCE");  
    }
}

if(keyboard_check(ord("E")) && getState("STATE_INDISTANCE") && !getState("STATE_TALKING")) {
    create_textbox(text_id);
    ObjectPlayer.setState("STATE_FROZEN");
    setState("STATE_TALKING");
}