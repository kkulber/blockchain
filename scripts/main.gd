extends Node2D

# Keep track of your generated block
var block_data = ""
var block_previous_hash = "615w7tf8ib18bg81enbcn18ibwze81izc81znbec"
var block_hash = "8u7qcn87b1ct8c17tc3r18tr187trc8bt1c8c1128bh78ct1z"

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

# Show the hashgenerator 
func show_hashgenerator() -> void:
	$CanvasLayer/Hashgenerator.visible = true 
	hashgenerator_shown = true
	
# Hide the hashgenerator 
func hide_hashgenerator() -> void:
	$CanvasLayer/Hashgenerator.visible = false	
	hashgenerator_shown = false

func _ready() -> void:
	data_dad = $CanvasLayer/YourBlock/VBoxContainer/data_rect
	previous_pointer_dad = $CanvasLayer/YourBlock/VBoxContainer/HBoxContainer/pointer_square
	hash_dad = $CanvasLayer/YourBlock/VBoxContainer/HBoxContainer/hash_square
	
	questcontainer = $CanvasLayer/Questcontainer
	
	previous_hash_visualizer_label = $CanvasLayer/Labels/PreviousHashVisualizerLabel
	hash_visualizer_label = $CanvasLayer/Labels/HashVisualizerLabel
	data_visualizer_label = $CanvasLayer/Labels/DataVisualizerLabel
	
	# Turns off the hashgenerator
	hide_hashgenerator()

func _process(delta: float) -> void:
	# Check if data dad has been set
	if data_dad.texture:
		questcontainer.trigger_quest_with_index(6)
		if input_field_text != data_visualizer_label.text:
			data_visualizer_label.text = input_field_text
	elif data_visualizer_label.text != "": 
		data_visualizer_label.text = ""
	
	# Check if previous hash has been set 
	if previous_pointer_dad.texture:
		if previous_hash_visualizer_label.text != block_previous_hash:
			previous_hash_visualizer_label.text = block_previous_hash
	elif not previous_pointer_dad.texture and previous_hash_visualizer_label.text != "": 
		previous_hash_visualizer_label.text = ""
	
	# Check each frame if previous hash and data dad
	# have been set
	if data_dad.texture and previous_pointer_dad.texture and not hashgenerator_shown:
		show_hashgenerator()
		questcontainer.trigger_quest_with_index(8)
		
	# Check each frame if the block is complete
	if data_dad.texture and previous_pointer_dad.texture and hash_dad.texture and not block_is_complete:
		block_is_complete = true
		questcontainer.trigger_quest_with_index(9)

# Function called, when the user enters some text
func _on_data_input_text_changed(new_text: String) -> void:
	questcontainer.trigger_quest_with_index(4)
	input_field_text = new_text
