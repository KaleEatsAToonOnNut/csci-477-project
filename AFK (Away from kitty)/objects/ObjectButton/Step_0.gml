// Inherit the parent event
event_inherited();

if(mouse_check_button_pressed(mb_left)) {
    if(isMouseOver()) {
        if(script_exists(callback)) {
            script_execute(callback);
        }
    }
}