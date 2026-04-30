// Inherit the parent event
has_parried = false
event_inherited();

addToStateList("STATE_MULTIATTACK");
addToStateList("STATE_PARRIED");

setState("STATE_INVULNERABLE");
setState("STATE_LOCK_MOMENTUM");

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
    if(ranged) {
        spd.x = data.projectileSpeed * cos(degtorad(parentStats.rOffset));
        spd.y = data.projectileSpeed * -sin(degtorad(parentStats.rOffset));
    }
}

alarm[1] = lifetime;