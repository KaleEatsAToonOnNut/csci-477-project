// Inherit ObjectBaseMoveable
event_inherited();

addToStateList("STATE_SLEEPING");
addToStateList("STATE_DASHING");
addToStateList("STATE_MOVING");
addToStateList("STATE_ATTACKING");

//window_set_fullscreen(true);

moveSpeed = 4;
//Stamina regeneration rates for standing still, walking, and dashing (also health and stamina regen for sleeping)
staminaRegenRate = [4, 8, 28, 10];
alarm[10] = staminaRegenRate[0];

max_hp = hp;
stamina = max_stamina;
dashSpeed = 16;

currentWeapon = "claws"

directions = {
    x: 0,
    y: 0
}

function catnap() {
    
}