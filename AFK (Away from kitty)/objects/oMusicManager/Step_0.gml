
var _finalVol = global.musicVolume * global.masterVolume;

//Play the target song
if songAsset != targetSongAsset
{
	//Tell the old song to fade out
	if audio_is_playing (songInstance)
	{
		array_push( fadeOutInstances, songInstance);
		array_push( fadeOutInstVol, fadeInInstVol)
		array_push( fadeOutInstTime, endFadeOutTime)
		
		songInstance = noone;
		songAsset = noone;
	}
	
	if array_length(fadeOutInstances) == 0 {
		if (audio_exists( targetSongAsset ) )
		{
			//play the song and store it's instance in a variable
			songInstance = audio_play_sound( targetSongAsset, 4, true);

			//start the song's volume at 0;
			audio_sound_gain( songInstance, 0, 0);
			fadeInInstVol = 0;
	
		}
		//Set the songAsset to match the tagert
		songAsset = targetSongAsset;
	}
	
}

//volume control

if (audio_is_playing(songInstance))
{
	//fade the song in
	if startFadeInTime > 0
	{
		if fadeInInstVol < 1 {fadeInInstVol += 1 /startFadeInTime; } else fadeInInstVol = 1;
	}
	else
	{
		fadeInInstVol = 1;
	}
	
	audio_sound_gain(songInstance, fadeInInstVol*_finalVol, 0);
	
}

//fading songs out
for( var i =0; i < array_length(fadeOutInstances); i++)
{
	if fadeOutInstTime[i] > 0
	{
		if fadeOutInstVol[i] > 0 {fadeOutInstVol[i] -= 1/fadeOutInstTime[i];};
	}
	else
	{
		fadeOutInstVol[i] = 0;
	}
	
	audio_sound_gain(fadeOutInstances[i], fadeOutInstVol[i]*_finalVol, 0);
	
	if fadeOutInstVol[i] <= 0
	{
			if (audio_is_playing(fadeOutInstances[i])) {audio_stop_sound(fadeOutInstances[i]);}
			array_delete(fadeOutInstances, i, 1);
			array_delete(fadeOutInstVol, i, 1);
			array_delete(fadeOutInstTime, i, 1);	
			i--;	
	}
}

