if(hp <= 0) {
    instance_destroy(self);
}

if(parent != noone) {
    x = parent.x + parentStats.offset.x;
    y = parent.y + parentStats.offset.y;
    image_angle = parentStats.rOffset;
    image_xscale = sign(parent.image_xscale) * abs(image_xscale);
    image_yscale = sign(parent.image_yscale) * abs(image_yscale);
}