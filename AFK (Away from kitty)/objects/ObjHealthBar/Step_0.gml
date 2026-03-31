//Test
if (instance_exists(ObjectPlayer)) {
    var p = instance_find(ObjectPlayer, 0);

    if (keyboard_check_pressed(ord("H"))) {
        p.hp = max(0, p.hp - 10);
    }

    if (keyboard_check_pressed(ord("J"))) {
        p.hp = min(p.max_hp, p.hp + 10);
    }
}