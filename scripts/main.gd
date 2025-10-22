extends Node2D

# Keep track of your generated block
var block_data = "Testdaten"
var block_last_hash = "Letzter Testhash"
var block_hash = "Aktueller Testhash"

# Declare all nodes used later
var block_label_last_hash_original
var block_label_last_hash_link
var block_label_hash
var block_label_data 

var data_dad
var previous_pointer_dad
var hashgenerator_shown = false

var hash_dad
var block_is_complete = false
var package_top

func show_hashgenerator() -> void:
	# Show the hashgenerator 
	$CanvasLayer/Hashgenerator.visible = true 
	hashgenerator_shown = true
	
func hide_hashgenerator() -> void:
	# Hide the hashgenerator 
	$CanvasLayer/Hashgenerator.visible = false	
	hashgenerator_shown = false

func _ready() -> void:
	# Import nodes
	block_label_last_hash_original = $CanvasLayer/Labels/BlockLastHashOriginal
	block_label_last_hash_link = $CanvasLayer/Labels/BlockLastHashLink
	block_label_hash = $CanvasLayer/Labels/BlockHash
	block_label_data = $CanvasLayer/Labels/BlockData
	
	# Setup labels
	block_label_last_hash_original.text = block_last_hash
	block_label_last_hash_link.text = block_last_hash
	block_label_data.text = block_data
	block_label_hash.text = block_hash
	
	data_dad = $CanvasLayer/YourBlock/data_rect
	previous_pointer_dad = $CanvasLayer/YourBlock/pointer_square
	hash_dad = $CanvasLayer/YourBlock/hash_square
	
	package_top = $CanvasLayer/YourBlock/PaketTop
	
	# Turns off the hashgenerator
	hide_hashgenerator()
	
	# Hide the package top part
	package_top.visible = false

func _process(delta: float) -> void:
	# Check each frame if previous hash and data dad
	# have been set
	if data_dad.texture and previous_pointer_dad.texture and not hashgenerator_shown:
		show_hashgenerator()
		
	# Check each frame if the block is complete
	if data_dad.texture and previous_pointer_dad.texture and hash_dad.texture and not block_is_complete:
		package_top.visible = true
		block_is_complete = true
# This function is called when the text inside
# the data input field changes
# func _on_data_input_text_changed(new_text: String) -> void:
# 	block_label_hash.text = new_text
