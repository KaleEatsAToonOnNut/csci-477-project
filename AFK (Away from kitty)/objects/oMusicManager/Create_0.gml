global.masterVolume = 1;
global.musicVolume =1;

songInstance = noone;
songAsset = noone;
targetSongAsset = noone;

endFadeOutTime = 0; //how many frames to fade out the song cureently playting
startFadeInTime = 0; //how many frames to fade out in the new song

fadeInInstVol = 1;

//for fading music out and stoping songs that are no  longer playing
fadeOutInstances = array_create(0);
fadeOutInstVol = array_create(0);
fadeOutInstTime = array_create(0);

