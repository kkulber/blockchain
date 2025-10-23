extends Node2D

# Keep track of your generated block
var block_data = "Testdaten"
var block_last_hash = "Letzter Testhash"
var block_hash = "Aktueller Testhash"

# Declare all nodes used later
var data_dad
var previous_pointer_dad
var hashgenerator_shown = false

var hash_dad
var block_is_complete = false

var questcontainer

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
	
	# Turns off the hashgenerator
	hide_hashgenerator()

func _process(delta: float) -> void:
	# Check if data dad has been set
	if data_dad.texture:
		questcontainer.trigger_quest_with_index(6)
	
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
