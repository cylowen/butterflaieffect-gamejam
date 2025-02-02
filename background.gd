extends Sprite3D

const FENSTER_VIEW_BAD_CHOICE = preload("res://art/pictures/objects/window/FEnster_VIEW-BAD-Choice-NEW.jpeg")
const FENSTER_VIEW_START_CHOICE = preload("res://art/pictures/objects/window/Fenster_VIEW-Start-choice-NEW.png")
const FENSTER_VIEW_GOOD_CHOICE = preload("res://art/pictures/objects/window/Fenster_View-GOOD-choice.png")

func _ready() -> void:
	SignalManager.connect("scene_changed", _on_scene_changed)


func _on_scene_changed() -> void:
	if GameManager.WINDOW_STATE == "start":
		texture = FENSTER_VIEW_START_CHOICE
		print("change window")
	if GameManager.WINDOW_STATE == "good":
		texture = FENSTER_VIEW_GOOD_CHOICE
		print("change window")
	if GameManager.WINDOW_STATE == "worst":
		texture = FENSTER_VIEW_BAD_CHOICE
		print("change window")
