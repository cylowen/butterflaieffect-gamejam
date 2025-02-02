extends Node3D

@onready var speaker_pickable_object: XRToolsPickable = $SpeakerPickableObject
@onready var ukulele_pickable_object: XRToolsPickable = $UkulelePickableObject


func _ready() -> void:
	SignalManager.connect("scene_changed", _on_scene_changed)


func _on_scene_changed() -> void:
	
	if GameManager.SPEAKER_STATE == "start":
		speaker_pickable_object.visible = true
		ukulele_pickable_object.visible = false
		print("change speaker")
		
	if GameManager.SPEAKER_STATE == "good":
		speaker_pickable_object.visible = false
		ukulele_pickable_object.visible = true
		print("change to ukulele")
		
	if GameManager.SPEAKER_STATE == "worst":
		speaker_pickable_object.visible = true
		ukulele_pickable_object.visible = false
		print("change speaker")
