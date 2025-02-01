extends Node3D


func _on_notice_picked_up(_pickable: Variant) -> void:
	if GameManager.NOTICE_STATE == "start":
		var sound_path = "res://art/audio/Eske_Leise_003.wav"
		#audio_stream_player.stream = SFX_BUBBLE_GRAB
		SignalManager.emit_signal("play_audio", sound_path)
		print("start sound")
	else:
		var sound_path = "res://art/audio/Harriett_DearMe_007.wav"
		#audio_stream_player.stream = load(sound_path)
		#audio_stream_player.play()
		SignalManager.emit_signal("play_audio", sound_path)
		print("start sound")
