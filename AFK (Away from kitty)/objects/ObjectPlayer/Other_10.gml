sprite_index = cat_sleep;

if(ui != noone) {
    instance_destroy(ui);
}

ui = instance_create_layer(0, 0, "Instances", ObjectTransitionUI)
    .setWidth(string(browser_width))
    .setHeight(string(browser_height))
    .setTiming(150)
    .setCallback(UIScriptRespawn);
