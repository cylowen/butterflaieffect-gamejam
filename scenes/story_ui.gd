extends CanvasLayer

func _ready() -> void:
	SignalManager.connect("change_text", _on_change_text)


func _on_change_text(new_text):
	if new_text:
		$Control/MarginContainer/RichTextLabel.text = new_text
	else:
		print("Text empty")
