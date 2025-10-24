extends Control

signal correct_answer
signal wrong_answer


var quiz_question

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var json = JSON.new()
	var quiz_JSON = FileAccess.open("res://content/quiz.json", FileAccess.READ).get_as_text()
	json.parse(quiz_JSON)
	var quiz = json.data["quiz"]
	
	print("Quiz count: ",quiz.size())
	
	var quizIndex = randi() % quiz.size() - 1
	
	if Globals.previous_question == quizIndex:
		quizIndex += 1
	
	Globals.previous_question = quizIndex
	
	quiz_question = quiz[quizIndex]
	%Label_question_text.text = quiz_question.frage
	%Button1_Quiz.text = quiz_question.antworten[0]
	%Button2_Quiz.text = quiz_question.antworten[1]
	%Button3_Quiz.text = quiz_question.antworten[2]
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	Globals.load_scene(Globals.menu_scene)


func _on_button_1_quiz_pressed() -> void:
	if %Button1_Quiz.text == quiz_question.richtige_antwort:
		correct_answer.emit()
		%Button1_Quiz.modulate = Color(0.07, 0.618, 0.0, 1.0)
		%Button_NextQuiz.show()
	else:
		wrong_answer.emit()
		%Button1_Quiz.modulate = Color(0.948, 0.0, 0.199, 1.0)


func _on_button_2_quiz_pressed() -> void:
	if %Button2_Quiz.text == quiz_question.richtige_antwort:
		correct_answer.emit()
		%Button2_Quiz.modulate = Color(0.07, 0.618, 0.0, 1.0)
		%Button_NextQuiz.show()
	else:
		wrong_answer.emit()
		%Button2_Quiz.modulate = Color(0.948, 0.0, 0.199, 1.0)


func _on_button_3_quiz_pressed() -> void:
	if %Button3_Quiz.text == quiz_question.richtige_antwort:
		correct_answer.emit()
		%Button3_Quiz.modulate = Color(0.07, 0.618, 0.0, 1.0)
		%Button_NextQuiz.show()
	else:
		wrong_answer.emit()
		%Button3_Quiz.modulate = Color(0.948, 0.0, 0.199, 1.0)


func _on_button_next_quiz_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/quiz.tscn")
