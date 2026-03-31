if(other == parent || array_contains(attacked, other)) {
    return;
}

if(!other.getState("STATE_INVULNERABLE")) {
    other.hp -= 1;
    array_push(attacked, other);
}