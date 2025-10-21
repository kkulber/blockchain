extends Node


### Music Volume ###
var music_volume = 0

func set_music_volume(volume): 
	Log.debug("[GlobalSettings] [set_music_volume] Volume change: " + str(volume))
	# safe volume to globalSettings
	music_volume = volume
	# set volume in globalAudio
	GlobalAudio.set_music_volume(music_volume)
