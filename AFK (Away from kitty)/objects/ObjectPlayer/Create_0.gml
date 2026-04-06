// Inherit ObjectBaseMoveable
event_inherited();

//window_set_fullscreen(true);

moving = false;
moveSpeed = 4;
dashing = false;
//Stamina regeneration rates for standing still, walking, and dashing
staminaRegenRate = [4, 12, 28];
alarm[10] = staminaRegenRate[0];

max_hp = hp;
stamina = max_stamina;
dashSpeed = 16;
attacking = false;

currentWeapon = "claws"

directions = {
    x: 0,
    y: 0
}

function catnap() {
    
}