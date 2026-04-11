if(getState("STATE_CONTACT_HARM_PLAYER") && !other.getState("STATE_INVULNERABLE") && !getState("STATE_NO_ATTACK") && meleeWeapon == "contact" && !other.getState("STATE_DEAD")) {
    projectile = instance_create_layer(x, y, "Instances", ObjectBaseWeaponProjectile);
    projectile.parent = self;
    projectile.overrideWeaponData(getWeaponInfo(meleeWeapon));
    projectile.parentStats.rOffset = point_direction(x, y, other.x, other.y);
}