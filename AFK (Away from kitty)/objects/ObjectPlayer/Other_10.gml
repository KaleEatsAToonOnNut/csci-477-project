sprite_index = cat_sleep
audio_play_sound(snd_playerdie,1,false,2,0,1)

if(ui != noone) {
    instance_destroy(ui);
}

ui = instance_create_layer(0, 0, "Instances", ObjectTransitionUI)
    .setWidth(string(browser_width))
    .setHeight(string(browser_height))
    .setTiming(300)
    .setCallback(UIScriptRespawn);
