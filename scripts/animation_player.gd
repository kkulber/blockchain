extends AnimationPlayer

var has_played_progress_bar = false

func play_package_plop():
	play("package_plop")

func play_advance_quest_bounce():
	play("advance_quest_bounce")
	
func play_lower_quest_bounce():
	play("lower_quest_bounce")
	
func play_hash_progess():
	if has_played_progress_bar: return
	has_played_progress_bar = true
	play("play_hashgenerator_hash")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_lower_quest_pressed() -> void:
	pass # Replace with function body.
