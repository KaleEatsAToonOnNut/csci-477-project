/// @description EXPLODE
show_debug_message("boom")
sprite_index = spr_explode40
audio_play_sound(snd_slimeexplode, 1, false, 1, 0, random_range(0.75, 1.25))

dieTimer = game_get_speed(gamespeed_fps) * 2
alarm[4] = dieTimer
