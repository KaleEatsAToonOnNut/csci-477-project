// Inherit the parent event
event_inherited();


if(isMouseOver()) {
    if(mouse_check_button_pressed(mb_left)) {
        if(script_exists(callback)) {
            script_execute(callback, params);
        }
    }
}