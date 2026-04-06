//Test
if (instance_exists(ObjectPlayer)) {
    var p = instance_find(ObjectPlayer, 0);

    if (keyboard_check_pressed(ord("H"))) {
        p.stamina = max(0, p.stamina - 10);
    }

    if (keyboard_check_pressed(ord("J"))) {
        p.stamina = min(p.max_stamina, p.stamina + 10);
    }
}