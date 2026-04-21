function getWeaponInfo(weaponName){
    weaponInfoList = {
        _default: {
            name: "Default",
            minDamage: 5,
            damageRange: 5,
            weaponRange: 10,
            ranged: false,
            projectileSpeed: 10,
            width: 1,
            height: 1,
            spriteOverride: spr_slash,
            isVisible: true,
            lifetime: 100,
            staminaCost: 20,
            knockback: 4
        },
        claws: {
            name: "Claws",
            minDamage: 25,
            damageRange: 10,
            ranged: false,
            width: 2,
            height: 2
        },
        contact: {
            name: "Contact Damage",
            minDamage: 15,
            isVisible: false,
            staminaCost: 5  
        },
        staff: {
            name: "Magic Staff",
            minDamage: 43,
            damageRange: 30,
            ranged: true,
            staminaCost: 30
        },
		cheese: {
            name: "Cheese",
            minDamage: 10,
            damageRange: 10,
            ranged: true,
<<<<<<< HEAD
            staminaCost: 0
=======
            staminaCost: 30,
            lifetime: 10000,
            spriteOverride: spr_treat_stick
>>>>>>> 660c7d19afb328fb57aaa2cf6cbb109c59f52f05
        }
    }
    var output = weaponInfoList._default;
    if(struct_exists(weaponInfoList, weaponName)) {
        output = overwriteItems(output, weaponInfoList[$ weaponName]);
    }
    return output;
}