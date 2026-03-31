if(hp <= 0) {
    instance_destroy(self);
}

if(parent != noone) {
    x = parent.x + parentStats.offset.x;
    y = parent.y + parentStats.offset.y;
    image_angle = parentStats.rOffset;
}