if(attacking) {
    return;
}

projectile = instance_create_layer(x, y, "Instances", ObjectBaseWeaponProjectile);
projectile.parent = self;
projectile.image_xscale = image_xscale * 2;
projectile.image_yscale = 2;

attacking = true;