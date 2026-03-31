// Inherit ObjectBaseMoveable
event_inherited();

moving = false;
moveSpeed = 4;
dashing = false;
dashDirection = 0;

function animation(spriteAnimation) {
    sprite_index = spriteAnimation;
}

max_hp = hp;
dashSpeed = 16;
attacking = false;