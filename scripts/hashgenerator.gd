extends Node2D

# Declaration of some variables
var hash_dad
var has_generated_hash = false

# Load the godot icon
var my_texture = load("res://images/square_blue.svg")

func _ready() -> void:
	hash_dad = $HashDad

func generate_hash():
	if not has_generated_hash:
		hash_dad.texture = my_texture
		has_generated_hash = true
