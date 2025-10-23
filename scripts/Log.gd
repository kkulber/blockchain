extends Node


func debug(text):
	print_rich("[color=darkcyan] [DEBUG] ", text, "[/color]")

func info(text):
	print_rich("[color=darkgreen] [INFO] ", text, "[/color]")

func error(text):
	print_rich("[color=red] [ERROR] ", text, "[/color]")

func warn(text):
	print_rich("[color=yellow] [WARNING] ", text, "[/color]")

func custom(type : String, color : String, text):
	print_rich("[color=", color, "]" ," [",type,"] ", text, "[/color]")
