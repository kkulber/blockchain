extends Node

# Dicitionary that stores all quests
var quests = [
	# 0
	"Willkommen, hier wird Dir Schritt für
	Schritt erklärt wie eine Blockchain funktioniert.",
	# 1
	"Fangen wir zunächst mit den Grundlagen einer
	Blockchain an, einem Block.",
	# 2
	"Den kannst du dir wie ein Paket vorstellen,
	wie es hier abgebildet ist.",
	# 3
	"Fülle dein Paket nun mit etwas Leben, indem
	du in das Feld unten eine beliebige Nachricht einträgst.",
	# 4
	"Super, nun ziehe den Datenblock neben dem Feld
	nach oben in das Paket.",
	# 5
	"Damit eine Blockchain funktioniert und die Blöcke
	tatsächlich aneinanderhängen, muss jeder Block auf den vorherigen
	Block verweisen.",
	# 6
	"Das machst Du, indem du den sogenannten Hash aus dem
	vorherigen Block in die Stelle dafür in Deinem Block ziehst.",
	# 7
	"Fast fertig! Damit Dein Block gültig wird und auch
	ein zukünftiger nächster Block auf ihn zeigen kann, braucht er auch
	einen eigenen Hash.",
	# 8
	"Um Deinen eigenen Hash zu erstellen drücke zunächst
	auf den Button oben rechts und ziehe den Hash in deinen Block.",
	# 9
	"Fertig! Dein Block ist fertig und das Paket ist
	sozusagen geschlossen. Schau Dir doch mal die komplette Kette
	hier an."
]
var label
var current_quest = 0
var current_quest_max = 3

func lower_quest() -> void:
	# Return if lowest quest is already selected
	if current_quest <= 0: return
	current_quest -= 1
	label.text = quests[current_quest]
	
func advance_quest() -> void:
	# Return if highest quest is already selected
	if current_quest >= len(quests)-1 or current_quest == current_quest_max: return
	current_quest += 1
	label.text = quests[current_quest]
	
func set_current_quest_max(new_max: int) -> void:
	current_quest_max = new_max

# Advances the current_quest and sets the current_quest_max directly to the passed
# quest. Only works if the current_quest_max is below the passed one.
# This prevents the user to be set back to a previous quest
func trigger_quest_with_index(index: int) -> void:
	if index <= current_quest_max: return	# Return if an already finished quest was triggered
	current_quest_max = index
	advance_quest()

func _ready() -> void:
	# Get label reference
	label = $Node2D/HBoxContainer/Text
	
	# Load first quest (usually 0)
	label.text = quests[current_quest]
