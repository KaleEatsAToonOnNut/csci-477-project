/// @description shoot proj

if( instance_exists(player) ){
	projectile = instance_create_layer(x, y, "Instances", ObjectBaseWeaponProjectile);
	projectile.parent = self;
	projectile.overrideWeaponData(getWeaponInfo("cheese"));
	projectile.parentStats.rOffset = point_direction(x, y, player.x, player.y);
}

alarm[3] = shootTimer