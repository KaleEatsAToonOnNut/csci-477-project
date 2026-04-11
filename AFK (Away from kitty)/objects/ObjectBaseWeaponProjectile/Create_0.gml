// Inherit the parent event
event_inherited();

addToStateList("STATE_MULTIATTACK");

setState("STATE_INVULNERABLE");
attacked = [];
ranged = false;

function overrideWeaponData(data) {
    sprite_index = data.spriteOverride;
    image_xscale = data.width;
    image_yscale = data.height;
    ranged = data.ranged;
    lifetime = data.lifetime;
    minDamage = data.minDamage;
    damageRange = data.damageRange;
    knockpower = data.knockback;
    visible = data.isVisible;
}

alarm[1] = lifetime;