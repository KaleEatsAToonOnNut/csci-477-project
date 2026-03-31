if(other == parent || array_contains(attacked, other)) {
    return;
}

if(!other.getState("STATE_INVULNERABLE")) {
    other.hp -= floor(random(damageRange)) + minDamage;
    array_push(attacked, other);
    other.applyKnockback(knockpower, degtorad(image_angle))
}