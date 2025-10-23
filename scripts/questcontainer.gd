extends Node

# Dicitionary that stores all quests
var quests = [
	# 0
	"Willkommen, hier wird Dir Schritt für
	Schritt erklärt wie eine Blockchain funktioniert.",
	# 1
	"Fangen wir mit den Bausteinen einer Blockchain an – den einzelnen Blöcken.",
	# 2
	"Stell dir jeden Block wie ein Paket vor – gefüllt mit Informationen.",
	# 3
	"Fülle dein Paket nun mit etwas Leben, indem
	du in das Feld unten eine beliebige Nachricht einträgst.",
	# 4
	"Super, nun ziehe den grünen Datenblock neben dem Eingabefeld
	nach oben in das Paket.",
	# 5
	"Damit die Blöcke zusammenhalten und eine Kette ('Chain') entsteht, 
	zeigt jeder Block auf den Vorherigen.",
	# 6
	"Das machst Du, indem du den roten Datenblock, den sogenannten 'Hash' in Deinen
	Block ziehst. Was genau ein Hash ist erkläre ich Dir gleich.",
	# 7
	"Fast geschafft! Nun bekommt auch Dein Block einen eigenen Hash – 
	der ist praktisch wie sein Fingerabdruck, welcher ihn eindeutig macht.",
	# 8
	"Um Deinen eigenen Hash zu erstellen drücke auf den Button 'Hash generieren' - 
	hier kannst Du erkennen, dass der Hash den Hash des letzten Blocks und deine Daten beinhaltet.",
	# 9
	"Herzlichen Glückwunsch! Du hast jetzt verstanden, 
	wie Blöcke verbunden werden und eine Blockchain entsteht."
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
