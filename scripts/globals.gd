extends Node

var menu_scene = preload("res://scenes/menu.tscn")
var guide_scene = preload("res://scenes/guide.tscn")
var settings_scene = preload("res://scenes/settings.tscn")
var lexikon_scene = preload("res://scenes/lexikon.tscn")
var layer1_scene = preload("res://scenes/layer-1.tscn")
var layer2_scene = preload("res://scenes/layer-2.tscn")
var layer3_scene = preload("res://scenes/layer-3.tscn")


func load_scene(scene: PackedScene) -> void:
	get_tree().change_scene_to_packed(scene)
