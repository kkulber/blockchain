extends Node

var blockchain_machines = []
const AMOUNT_MACHINES = 10
const LENGTH_CHAIN_MIN = 15
const LENGTH_CHAIN_MAX =  30
const TRANSFER_MIN = 1
const TRANSFER_MAX = 500


const EURO = "€"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Read common german names from JSON File
	var json = JSON.new()
	var names_JSON = FileAccess.open("res://content/names.json", FileAccess.READ).get_as_text()
	json.parse(names_JSON)
	var names = json.data["names"]
	
	# Add an empty blockchain to every machine
	for i in range(AMOUNT_MACHINES):
		blockchain_machines.append([])
	
	# Generate a random blockchain
	var rng = RandomNumberGenerator.new()
	var chain_length = rng.randi_range(LENGTH_CHAIN_MIN, LENGTH_CHAIN_MAX)
	var previous_hash = "0"
	for i in range(chain_length):
		# Create a random block for the blockchains of all machines
		var random_content = "%s überweist %d%s an %s" \
			% [names[rng.randi_range(0, names.size() - 1)], rng.randi_range(TRANSFER_MIN, TRANSFER_MAX), 
			EURO, names[rng.randi_range(0, names.size() - 1)]]
		var new_hash = (random_content + previous_hash).sha256_text()
		for machine in blockchain_machines:
			machine.append({
				"content": random_content,
				"previous_hash": previous_hash,
				"current_hash": new_hash
			})
		previous_hash = new_hash
	print(blockchain_machines)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
