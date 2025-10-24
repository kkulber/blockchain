extends Node2D

# Declaration of some variables
var hash_dad
var has_generated_hash = false
var data_label
var previous_hash_label

# Load the godot icon
var my_texture = load("res://images/square_blue.svg")

func generate_hash():
	if not has_generated_hash:
		hash_dad.texture = my_texture
		has_generated_hash = true

func _ready() -> void:
	# Initialize references
	hash_dad = $HashDad
	data_label = $DataHashGenLabel
	previous_hash_label = $PreviousHashGenLabel
	
	# Clear labels
	data_label.text = ""
	previous_hash_label.text = ""
