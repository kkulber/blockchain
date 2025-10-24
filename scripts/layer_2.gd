extends Node2D


func _on_button_pressed() -> void:
	#Globals.load_scene(Globals.layer1_scene)
	get_tree().change_scene_to_file("res://scenes/layer-3.tscn")

func _on_back_layer_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/layer1.tscn")
