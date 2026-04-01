if(getState("STATE_CONTACT_HARM_PLAYER") && !other.getState("STATE_INVULNERABLE") && !getState("STATE_NO_ATTACK")) {
    other.applyKnockback(5, direction);
    other.hp -= floor(random(damageRange)) + minDamage;
}