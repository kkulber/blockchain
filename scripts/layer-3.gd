extends Node

const MACHINE_POSITIONS = [
	Vector2(-450, -150),
	Vector2(-340, 50),
	Vector2(-320, -320),
	Vector2(-40, -310),
	Vector2(-110, -30),
	Vector2(-160, 270),
	Vector2(100, 320),
	Vector2(90, 120),
	Vector2(90, -140),
	Vector2(210, -310),
	Vector2(310, 0),
	Vector2(380, 220),
	Vector2(450, -220)
]

const MACHINE = preload("res://scenes/layer3-machine.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# generate the machines in the network (in the form of dots)
	for machine_id in range(BlockchainNetwork.AMOUNT_MACHINES):
		var machine = MACHINE.instantiate()
		machine.id = machine_id
		machine.position = MACHINE_POSITIONS[machine_id]
		self.add_child(machine)
		
	# color based on validity


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
