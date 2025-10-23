extends Node2D

var music_volume = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func play_background_music():
	%Audio_BackgroundMusic.play()

func stop_background_music():
	%Audio_BackgroundMusic.stop()

func apply_music_volume():
	%Audio_BackgroundMusic.set_volume_db(music_volume)

func set_music_volume(volume):
	music_volume = volume
	apply_music_volume()
