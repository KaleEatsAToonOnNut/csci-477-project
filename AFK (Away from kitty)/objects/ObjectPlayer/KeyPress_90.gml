if(getState("STATE_ATTACKING")) {
    return;
}

if(stamina - getWeaponInfo(currentWeapon).staminaCost < 0 || getState("STATE_DEAD")) {
    return;
}
stamina -= getWeaponInfo(currentWeapon).staminaCost;

projectile = instance_create_layer(x, y, "Instances", ObjectBaseWeaponProjectile);
projectile.parent = self;
if(directions.x == 0 && directions.y == 0) {
    projectile.parentStats.rOffset = point_direction(0, 0, image_xscale, 0);
} else {
    projectile.parentStats.rOffset = point_direction(0, 0, directions.x, directions.y);
}
projectile.overrideWeaponData(getWeaponInfo(currentWeapon));

setState("STATE_ATTACKING");

audio_play_sound(snd_playerattack, 1, false, 1, 0, random_range(1, 1.5))