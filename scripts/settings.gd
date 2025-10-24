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


func _on_button_dark_mode_pressed() -> void:
	if %Button_DarkMode.text == "Deaktiviert":
		%Button_DarkMode.text = "Aktiviert"
		%Button_DarkMode.modulate = Color(0.133, 0.133, 0.133, 1.0)
		self.modulate = Color(0.679, 0.679, 0.679, 1.0)
	else:
		%Button_DarkMode.text = "Deaktiviert"
		%Button_DarkMode.modulate = Color(0.91, 0.91, 0.91, 1.0)
		self.modulate = Color(1.0, 1.0, 1.0, 1.0)
