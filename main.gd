extends Node3D

@export var bubble: PackedScene
@export var box: PackedScene

@onready var talk_audio_stream_player: AudioStreamPlayer = $TalkAudioStreamPlayer


var xr_interface: XRInterface
var state = 0


func _ready() -> void:
	randomize()
	SignalManager.connect("play_audio", _on_audio_play)
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("open xr initialized successfully")
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
	else:
		print("open xr not initialized")



func _load_text(path):
	var text_file = FileAccess.open(path, FileAccess.READ)
	if text_file:
		var text = text_file.get_as_text()
		text_file.close()
		return text
	else:
		print("Error: Could not open text file.", path)


func _on_timer_timeout() -> void:
	if (state == 0):
		GameManager.NOTICE_STATE = "worst"
		GameManager.WINDOW_STATE = "worst"
		GameManager.COATRACK_STATE = "worst"
		GameManager.FOTO_STATE = "good"
		SignalManager.emit_signal("scene_changed")
		state += 1
	elif(state == 1):
		GameManager.NOTICE_STATE = "good"
		GameManager.WINDOW_STATE = "good"
		GameManager.COATRACK_STATE = "good"
		GameManager.FOTO_STATE = "worst"
		SignalManager.emit_signal("scene_changed")
		state += 1
	elif (state == 2):
		GameManager.NOTICE_STATE = "start"
		GameManager.WINDOW_STATE = "start"
		GameManager.COATRACK_STATE = "start"
		GameManager.FOTO_STATE = "start"
		SignalManager.emit_signal("scene_changed")
		state = 0
	
	print("changed stuff")

func _on_audio_play(text) -> void:
	if !talk_audio_stream_player.playing:
		talk_audio_stream_player.stream = load(text)
		talk_audio_stream_player.play()
		print(text)
