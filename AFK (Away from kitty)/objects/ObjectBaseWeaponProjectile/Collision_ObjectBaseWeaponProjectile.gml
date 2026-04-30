if(!getState("STATE_PARRIED") && other.ranged) {
    other.spd.x *= -1;
    other.spd.y *= -1;
	other.setState("STATE_PARRIED")
	if (!has_parried) {
		audio_play_sound(snd_projparried, 1, false, 1, 0, random_range(1, 1.5))
		has_parried = true
	}
}