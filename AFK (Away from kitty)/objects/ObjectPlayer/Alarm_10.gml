if(stamina < max_stamina) {
    stamina += 1;
}

if(dashing) {
    alarm[10] = staminaRegenRate[2];
} else if(moving) {
    alarm[10] = staminaRegenRate[1];
} else {
    alarm[10] = staminaRegenRate[0];
}