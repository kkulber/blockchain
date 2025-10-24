extends Node2D

# Keep track of your generated block
var block_data = ""
var block_previous_hash = "0000"
var block_hash = "0000"

# Declare all nodes used later
var data_dad
var previous_pointer_dad
var hashgenerator_shown = false

var hash_dad
var block_is_complete = false

var questcontainer

# Smaller labels under the description labels to display contained data
var previous_hash_visualizer_label
var hash_visualizer_label
var data_visualizer_label
var input_field_text = ""

var hashgenerator

var animation_player

# Communication functions (gets and sets) for the values of the block
# 	- data a block holds (block_data)
# 	- the hash of the previous block (block_previous_hash)
# 	- own hash of the block (block_hash)
func get_block_data() -> String:
	return block_data
	
func set_block_data(new_data: String) -> void:
	block_data = new_data
	
func get_block_previous_hash() -> String:
	return block_previous_hash
	
func set_block_previous_hash(new_previous_hash: String) -> void:
	block_previous_hash = new_previous_hash
	
func get_block_hash() -> String:
	return block_hash

func set_block_hash(new_hash: String) -> void:
	block_hash = new_hash


# -- Regular main script functions --

# Show the hashgenerator 
func show_hashgenerator() -> void:
	$CanvasLayer/Hashgenerator.visible = true 
	hashgenerator_shown = true
	
# Hide the hashgenerator 
func hide_hashgenerator() -> void:
	$CanvasLayer/Hashgenerator.visible = false	
	hashgenerator_shown = false

# Just clears the text of an label
func clear_label_text(label):
	label.text = ""


# -- Godot's built in functions --

func _ready() -> void:
	data_dad = $CanvasLayer/YourBlock/VBoxContainer/data_rect
	previous_pointer_dad = $CanvasLayer/YourBlock/VBoxContainer/HBoxContainer/pointer_square
	hash_dad = $CanvasLayer/YourBlock/VBoxContainer/HBoxContainer/hash_square
	
	questcontainer = $CanvasLayer/Questcontainer
	
	previous_hash_visualizer_label = $CanvasLayer/Labels/PreviousHashVisualizerLabel
	hash_visualizer_label = $CanvasLayer/Labels/HashVisualizerLabel
	data_visualizer_label = $CanvasLayer/Labels/DataVisualizerLabel
	
	hashgenerator = $CanvasLayer/Hashgenerator
	
	animation_player = $AnimationPlayer
	
	block_previous_hash = BlockchainNetwork.blockchain_machines \
	 	[BlockchainNetwork.current_id]["blockchain"][-1]["hash"]

	# Turns off the hashgenerator
	hide_hashgenerator()

func _process(delta: float) -> void:
	# Player places data in the package
	if data_dad.texture:
		questcontainer.trigger_quest_with_index(7)		# Trigger quest for completing writing your data
		# Updates some values if not already happened
		if input_field_text != data_visualizer_label.text:
			data_visualizer_label.text = input_field_text
			hashgenerator.data_label.text = input_field_text
			animation_player.play_package_plop()
	# Clears label if not using
	elif data_visualizer_label.text != "": clear_label_text(data_visualizer_label)
	
	# Player places the previous hash in the package 
	if previous_pointer_dad.texture:
		# Updates values if not happened
		if previous_hash_visualizer_label.text != block_previous_hash:
			previous_hash_visualizer_label.text = block_previous_hash
			hashgenerator.previous_hash_label.text = block_previous_hash
			animation_player.play_package_plop()
	# Clears label, when not using
	elif not previous_pointer_dad.texture and previous_hash_visualizer_label.text != "": clear_label_text(previous_hash_visualizer_label)
	
	# Player places own hash in the package
	if hash_dad.texture:
		if hash_visualizer_label.text != block_hash: 
			hash_visualizer_label.text = block_hash
			animation_player.play_package_plop()
	elif hash_visualizer_label.text != "": hash_visualizer_label.text = ""
	
	# Check each frame if previous hash and data dad
	# have been set
	if data_dad.texture and previous_pointer_dad.texture and not hashgenerator_shown:
		show_hashgenerator()
		questcontainer.trigger_quest_with_index(9)
		
	# Check each frame if the block is complete
	if data_dad.texture and previous_pointer_dad.texture and hash_dad.texture and not block_is_complete:
		block_is_complete = true
		questcontainer.trigger_quest_with_index(10)

# Function called, when the user enters some text
func _on_data_input_text_changed(new_text: String) -> void:
	questcontainer.trigger_quest_with_index(4)
	input_field_text = new_text


func _on_back_pressed() -> void:
	#Globals.load_scene(Globals.layer2_scene)
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_forward_pressed() -> void:
	Globals.load_scene(Globals.layer2_scene)
