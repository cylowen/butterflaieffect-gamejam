extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var text_file = FileAccess.open("res://art/texts/eske_leise.txt", FileAccess.READ)
	if text_file:
		self.text = text_file.get_as_text()
		text_file.close()
	else:
		print("Error: Could not open text file.")
		#var file = FileAccess.open("res://art/texts/eske_leise.txt", FileAccess.READ)
		#var text = file.get_as_text()
		#print(text)
	
	# var rich_text_label = story_ui.get_node("Control/MarginContainer/RichTextLabel")
	# rich_text_label.text = "This is the new text for the bubble!"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
