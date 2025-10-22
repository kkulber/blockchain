extends Control

signal settings_close


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Settings.hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_volume_slider_value_changed(value: float) -> void:
	Log.debug("[SETTINGS] [_on_volume_slider_value_changed] volume slider changed to: " + str(value))
	GlobalSettings.set_music_volume(%VolumeSlider.value)


func _on_back_pressed() -> void:
	Globals.load_scene(Globals.menu_scene)
	#self.hide()
	#Menu.show()

func _on_save_pressed() -> void:
	GlobalSettings.save_settings()
