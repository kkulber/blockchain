extends Node

# Dicitionary that stores all quests
var quests = [
	"Willkommen, hier wird Dir Schritt für
	Schritt erklärt wie eine Blockchain funktioniert.",
	"Fangen wir zunächst mit den Grundlagen einer
	Blockchain an, einem Block.",
	"Den kannst du dir wie ein Paket vorstellen,
	wie es hier abgebildet ist.",
	"Fülle dein Paket nun mit etwas Leben, indem
	du in das Feld unten eine beliebige Nachricht einträgst.",
	"Super, nun ziehe den Datenblock neben dem Feld
	nach oben in das Paket.",
	"Damit eine Blockchain funktioniert und die Blöcke
	tatsächlich aneinanderhängen, muss jeder Block auf den vorherigen
	Block verweisen.",
	"Das machst Du, indem du den sogenannten Hash aus dem
	vorherigen Block in die Stelle dafür in Deinem Block ziehst.",
	"Fast fertig! Damit Dein Block gültig wird und auch
	ein zukünftiger nächster Block auf ihn zeigen kann, braucht er auch
	einen eigenen Hash.",
	"Um Deinen eigenen Hash zu erstellen drücke zunächst
	auf den Button oben rechts und ziehe den Hash in deinen Block.",
	"Fertig! Dein Block ist fertig und das Paket ist
	sozusagen geschlossen. Schau Dir doch mal die komplette Kette
	hier an."
]
var label
var current_quest = 0

func lower_quest():
	# Return if lowest quest is already selected
	if current_quest <= 0: return
	current_quest -= 1
	label.text = quests[current_quest]
	
func advance_quest():
	# Return if highest quest is already selected
	if current_quest >= len(quests)-1: return
	current_quest += 1
	label.text = quests[current_quest]

func _ready() -> void:
	# Get label reference
	label = $Text
	
	# Load first quest (usually 0)
	label.text = quests[current_quest]
