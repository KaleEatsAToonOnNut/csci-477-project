if(keyboard_check(ord("E"))) {
    with(children[cursor]) {
        if(script_exists(callback)) {
            script_execute(callback);
        }
    }
} else if(keyboard_check(ord("W")) || keyboard_check(vk_up)) {
    progressCursor(-1);
} else if(keyboard_check(ord("S")) || keyboard_check(vk_down)) {
    progressCursor(1);
}