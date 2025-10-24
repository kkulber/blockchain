extends Node2D

const BLOCK = preload("res://scenes/layer2-block.tscn")

const DISTANCE_BLOCKS = 470

func _ready() -> void:
	var amount_blocks = BlockchainNetwork.blockchain_machines[BlockchainNetwork.current_id]["blockchain"].size()
	for block_id in range(amount_blocks - 1, -1, -1):
		print(block_id)
		var block = BLOCK.instantiate()
		block.id = block_id
		block.position = Vector2(-((amount_blocks - block_id - 1) * DISTANCE_BLOCKS), 0)
		$"CanvasLayer/blockchain-container"/blockchain.add_child(block)

func _on_button_pressed() -> void:
	Globals.load_scene(Globals.layer1_scene)

func _on_back_layer_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/layer-3.tscn")


func _on_left() -> void:
	$"CanvasLayer/blockchain-container".translate(Vector2(DISTANCE_BLOCKS, 0))
	$AnimationPlayer.play("left")

func _on_right() -> void:
	$"CanvasLayer/blockchain-container".translate(Vector2(-DISTANCE_BLOCKS, 0))
	$AnimationPlayer.play("right")

func _new_block() -> void:
	Globals.load_scene(Globals.layer1_scene)
