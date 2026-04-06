if(attacking) {
    return;
}

if(stamina - getWeaponInfo(currentWeapon).staminaCost < 0) {
    return;
}
stamina -= getWeaponInfo(currentWeapon).staminaCost;

projectile = instance_create_layer(x, y, "Instances", ObjectBaseWeaponProjectile);
projectile.parent = self;
projectile.overrideWeaponData(getWeaponInfo(currentWeapon));

attacking = true;