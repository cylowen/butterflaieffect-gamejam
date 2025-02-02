extends Node3D


var start_sound_path = "res://art/audio/Narrator/Item 4- start.wav"
var good_sound_path = "res://art/audio/Narrator/Item 4- good.wav"
var worst_sound_path = "res://art/audio/Narrator/Item 4- worst.wav"


func _on_foto_1_pickable_object_picked_up(pickable: Variant) -> void:
	SignalManager.emit_signal("item_touched", GameManager.Items.Photos)
	if GameManager.FOTO_STATE == "start":
		#var sound_path = "res://art/audio/Eske_Leise_003.wav"
		SignalManager.emit_signal("play_audio", start_sound_path)
		print("start sound")
	elif GameManager.FOTO_STATE == "good":
		SignalManager.emit_signal("play_audio", good_sound_path)
		print("start sound")
	elif GameManager.FOTO_STATE == "worst":
		#var sound_path = "res://art/audio/Harriett_DearMe_007.wav"
		SignalManager.emit_signal("play_audio", worst_sound_path)
		print("start sound")
