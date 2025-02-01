extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var story_ui = load("res://scenes/story_ui.tscn").instance()
	add_child(story_ui)
	var rich_text_label = story_ui.get_node("Control/MarginContainer/RichTextLabel")
	rich_text_label.text = "This is the new text for the bubble!"

	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
