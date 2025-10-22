extends Node

var blockchain_machines = []

const AMOUNT_MACHINES = 15
const LENGTH_CHAIN_MIN = 15
const LENGTH_CHAIN_MAX =  30
const TRANSFER_MIN = 1
const TRANSFER_MAX = 500
const PROBABILITY_BREAK = 0.05
const MODIFIED_CHAINS_MIN = 1
const MODIFIED_CHAINS_MAX = 4

const EURO = "€"
const CHARACTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

# function that creates random content for a block
func generate_random_content(names):
	var rng = RandomNumberGenerator.new()
	return "%s überweist %d%s an %s" \
		% [names[rng.randi_range(0, names.size() - 1)], rng.randi_range(TRANSFER_MIN, TRANSFER_MAX), 
		EURO, names[rng.randi_range(0, names.size() - 1)]]

# function to add a block to the blockchain of a random machine
func add_block_to_machine(content, id, previous_hash=null, hash=null):
	if blockchain_machines[id]["blockchain"].size() == 0:
		previous_hash = "0"
	else:
		previous_hash = blockchain_machines[id]["blockchain"][blockchain_machines[id]["blockchain"].size() - 1]["hash"]
	blockchain_machines[id]["blockchain"].append({
		"content": content,
		"previous_hash": previous_hash,
		"hash": (content + previous_hash).sha256_text()
	})
	
# function to validate the blockchain of a machine
func validate_blockchain(id):
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# read common german names from JSON File
	var json = JSON.new()
	var names_JSON = FileAccess.open("res://content/names.json", FileAccess.READ).get_as_text()
	json.parse(names_JSON)
	var names = json.data["names"]
	
	# add an empty blockchain to every machine
	for i in range(AMOUNT_MACHINES):
		blockchain_machines.append({
			"name": null,
			"blockchain": []
		})
	
	# pick random names for machines
	var rng = RandomNumberGenerator.new()
	var used_names = []
	for machine_index in range(AMOUNT_MACHINES):
		var name_index = rng.randi_range(0, names.size() - 1)
		blockchain_machines[machine_index]["name"] = names[name_index]
		used_names.append(names[name_index]) 
		names.remove_at(name_index)
	
	# generate a random blockchain
	var chain_length = rng.randi_range(LENGTH_CHAIN_MIN, LENGTH_CHAIN_MAX)
	var broken_machines = []
	var previous_hash = "0"
	for i in range(chain_length):
		
		# randomly break blockchains of singular machines
		if rng.randf() < PROBABILITY_BREAK:
			var broken_machine_index = rng.randi_range(0, AMOUNT_MACHINES - 1)
			if broken_machine_index in broken_machines:
				continue
			broken_machines.append(broken_machine_index)
			var random_content = generate_random_content(names)
			random_content[rng.randi_range(0, random_content.length() - 1)] = CHARACTERS[rng.randi_range(0, CHARACTERS.length() - 1)]
			add_block_to_machine(random_content, broken_machine_index)
			
		# if a block isn't broken, all machines validate it
		else:
			for machine_index in range(AMOUNT_MACHINES):
				if machine_index in broken_machines:
					continue
				add_block_to_machine(generate_random_content(names), machine_index)
	
	# randomly modify blockchains to invalidate them
	for i in range(rng.randi_range(MODIFIED_CHAINS_MIN, MODIFIED_CHAINS_MAX)):
		var broken_machine = blockchain_machines[rng.randi_range(0, AMOUNT_MACHINES - 1)]
		broken_machine["blockchain"][rng.randi_range(0, broken_machine.size())]["content"] = generate_random_content(names)
		print(broken_machine)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
