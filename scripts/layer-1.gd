extends Node2D
	
var counter = 0	
var source_image = load("res://icon.svg")
	
func _ready():
	# Prepare signals
	$CanvasLayer/Block/Add.pressed.connect(add_block)
	
	# Reset counter label
	$CanvasLayer/Counter/Label.text = str(counter)
	
# Function called when a block gets added
func add_block():
	# Increase counter
	counter += 1
	$CanvasLayer/Counter/Label.text = str(counter)
	
	# Reset block
	$CanvasLayer/Block/Data_DaD_Block.texture = null
	$CanvasLayer/Block/Pointer_DaD_Block.texture = null
	$CanvasLayer/Block/Hash_DaD_Block.texture = null
	
	# Add new blocks
	$CanvasLayer/TextureRect.texture = source_image
	$CanvasLayer/TextureRect2.texture = source_image
	$CanvasLayer/TextureRect3.texture = source_image
	
func _process(delta: float) -> void:
<<<<<<< Updated upstream
	if $CanvasLayer/Block/Data_DaD_Block.texture and $CanvasLayer/Block/Pointer_DaD_Block.texture and $CanvasLayer/Block/Hash_DaD_Block.texture:
		$CanvasLayer/Block/Panel.modulate = Color.GREEN
		$CanvasLayer/Block/Deckel.visible = true
		$CanvasLayer/Block/Add.visible = true
	else:
		$CanvasLayer/Block/Panel.modulate = Color.RED
		$CanvasLayer/Block/Deckel.visible = false
		$CanvasLayer/Block/Add.visible = false
=======
	
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
>>>>>>> Stashed changes
