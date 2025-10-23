extends Node

var id

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# make machine red if not valid
	var unvalidated_texture = load("res://images/invalid-machine.png")
	if !BlockchainNetwork.is_valid_blockchain(id):
		$sprite.texture = unvalidated_texture

func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	# open Layer 2 using id when machine is clicked
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print(id)
		Log.debug("Initiating scene switch")
		Globals.load_scene(Globals.layer2_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
