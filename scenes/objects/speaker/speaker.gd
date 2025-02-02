extends Node3D

@onready var speaker_pickable_object: XRToolsPickable = $SpeakerPickableObject
@onready var ukulele_pickable_object: XRToolsPickable = $UkulelePickableObject

var start_sound_path = "res://art/audio/Narrator/Item 5- start.wav"
var good_sound_path = "res://art/audio/Narrator/Item 5- good.wav"
var worst_sound_path = "res://art/audio/Narrator/Item 5- worst.wav"

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


func _on_speaker_pickable_object_picked_up(pickable: Variant) -> void:
	play_sound()


func _on_ukulele_pickable_object_picked_up(pickable: Variant) -> void:
	play_sound() 

func play_sound() -> void:
	SignalManager.emit_signal("item_touched", GameManager.Items.Speaker)
	if GameManager.SPEAKER_STATE == "start":
	#var sound_path = "res://art/audio/Eske_Leise_003.wav"
		SignalManager.emit_signal("play_audio", start_sound_path)
		print("start sound")
	elif GameManager.SPEAKER_STATE == "good":
		SignalManager.emit_signal("play_audio", good_sound_path)
		print("start sound")
	elif GameManager.SPEAKER_STATE == "worst":
		#var sound_path = "res://art/audio/Harriett_DearMe_007.wav"
		SignalManager.emit_signal("play_audio", worst_sound_path)
		print("start sound")
