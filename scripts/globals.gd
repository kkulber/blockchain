extends Node

var menu_scene = preload("res://scenes/menu.tscn")
var settings_scene = preload("res://scenes/settings.tscn")
var lexikon_scene = preload("res://scenes/lexikon.tscn")

var layer1_scene = preload("res://scenes/layer-1.tscn")

func load_scene(scene: PackedScene) -> void:
	get_tree().change_scene_to_packed(scene)
