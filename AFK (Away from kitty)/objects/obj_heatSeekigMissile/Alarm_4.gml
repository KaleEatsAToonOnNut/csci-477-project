/// @description shoot proj

if(instance_exists(ObjectPlayer)){
    if(ObjectPlayer.getState("STATE_DEAD")) {
        return;
    }
	projectile = instance_create_layer(x, y, "Instances", ObjectBaseWeaponProjectile);
	projectile.parent = self;
    projectile.parentStats.rOffset = point_direction(x, y, ObjectPlayer.x, ObjectPlayer.y);
	projectile.overrideWeaponData(getWeaponInfo("cheese"));
}

alarm[4] = shootTimer