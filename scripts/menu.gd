extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_settings_pressed() -> void:
	Globals.load_scene(Globals.settings_scene)
	#Settings.show()
	#self.hide()
	#Menu.hide()


func _on_button_lexikon_pressed() -> void:
	Globals.load_scene(Globals.lexikon_scene)


func _on_button_start_pressed() -> void:
	Globals.load_scene(Globals.guide_scene)
