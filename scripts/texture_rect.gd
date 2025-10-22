extends TextureRect

func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(50, 50)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	set_drag_preview(preview)
	
	# Hier fügen wir eine Referenz zur Quelle hinzu
	var drag_data = {
		"texture": texture,
		"source": self
	}
	
	return drag_data


func _can_drop_data(_pos, data):
	return typeof(data) == TYPE_DICTIONARY and data.has("texture")


func _drop_data(_pos, data):
	# Ziel erhält die Textur
	texture = data["texture"]
	
	# Quelle leeren, aber nur, wenn Ziel != Quelle
	if data["source"] != self:
		data["source"].texture = null
