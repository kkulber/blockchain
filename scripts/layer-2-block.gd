extends Node

var id

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var block = BlockchainNetwork.blockchain_machines[BlockchainNetwork.current_id]["blockchain"][id]
	$HashLabel2.text += block["hash"]
	$InhaltLabel2.text += block["content"]
	$LetzterHashLabel2.text += block["previous_hash"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
