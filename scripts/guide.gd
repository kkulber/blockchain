extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	Globals.load_scene(Globals.menu_scene)

func _unhandled_input(event):
	$SubViewportContainer3/SubViewport3.push_input(event)
