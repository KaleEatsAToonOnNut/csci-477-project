if(!getState("STATE_PARRIED") && other.ranged) {
    other.spd.x *= -1;
    other.spd.y *= -1;
    other.setState("STATE_PARRIED");
}