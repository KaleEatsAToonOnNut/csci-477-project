if(stamina < max_stamina) {
    stamina += 1;
}

if(getState("STATE_SLEEPING")) {
    alarm[10] = staminaRegenRate[3];
} else if(getState("STATE_DASHING")) {
    alarm[10] = staminaRegenRate[2];
} else if(getState("STATE_MOVING")) {
    alarm[10] = staminaRegenRate[1];
} else {
    alarm[10] = staminaRegenRate[0];
}