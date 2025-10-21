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
	if $CanvasLayer/Block/Data_DaD_Block.texture and $CanvasLayer/Block/Pointer_DaD_Block.texture and $CanvasLayer/Block/Hash_DaD_Block.texture:
		$CanvasLayer/Block/Panel.modulate = Color.GREEN
		$CanvasLayer/Block/Deckel.visible = true
		$CanvasLayer/Block/Add.visible = true
	else:
		$CanvasLayer/Block/Panel.modulate = Color.RED
		$CanvasLayer/Block/Deckel.visible = false
		$CanvasLayer/Block/Add.visible = false
