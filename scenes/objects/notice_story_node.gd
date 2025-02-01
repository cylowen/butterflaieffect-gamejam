extends Node3D

var notice_start_sound_path = "res://art/audio/Eske_Leise_003.wav"
var notice_good_sound_path = "res://art/audio/Harriett_DearMe_007.wav"
var notice_worst_sound_path = "res://art/audio/Eske_Leise_003.wav"

func _on_notice_picked_up(_pickable: Variant) -> void:
	if GameManager.NOTICE_STATE == "start":
		#var sound_path = "res://art/audio/Eske_Leise_003.wav"
		SignalManager.emit_signal("play_audio", notice_start_sound_path)
		print("start sound")
	if GameManager.NOTICE_STATE == "good":
		SignalManager.emit_signal("play_audio", notice_good_sound_path)
		print("start sound")
	else:
		#var sound_path = "res://art/audio/Harriett_DearMe_007.wav"
		SignalManager.emit_signal("play_audio", notice_worst_sound_path)
		print("start sound")
