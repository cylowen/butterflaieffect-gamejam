extends Node3D

@export var bubble: PackedScene
@export var box: PackedScene
@export var screen_down: Vector3 = Vector3(0.275, 0.66, -0.975)
@export var screen_up: Vector3 = Vector3(0.275, 1.66, -0.85)

@onready var talk_audio_stream_player: AudioStreamPlayer = $TalkAudioStreamPlayer
@onready var music_audio_stream_player: AudioStreamPlayer = $MusicAudioStreamPlayer


const STORY_SCREEN: PackedScene = preload("res://scenes/story_screen.tscn")

var data_path = "res://data.json"
var state = 0
var screen_speed: float = 1.0
var xr_interface: XRInterface

var gamedata
var screen
#var tween

func _ready() -> void:
	randomize()
	load_game_data()
	
	screen = STORY_SCREEN.instantiate()
	add_child(screen)
	screen.position = screen_down
	screen.rotation.x = deg_to_rad(7)
	#tween = screen.create_tween()
	#tween = get_tree().create_tween()
	
	SignalManager.connect("play_audio", _on_audio_play)
	SignalManager.connect("item_touched", _on_item_touched)
	SignalManager.connect("button_pressed", _on_button_pressed)
	SignalManager.connect("scene_changed", _on_scene_changed)
	
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("open xr initialized successfully")
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
	else:
		print("open xr not initialized")

func _on_item_touched(item_id: String):
	print_debug("item touched: " + item_id)
	var item = gamedata[item_id]
	screen.position = screen_up
	SignalManager.emit_signal("load_articles", item_id, item)
	#tween.tween_property(screen, "position", screen_up, screen_speed)
	
	
func _on_button_pressed(item_id: String, state: String):
	match item_id:
		GameManager.Items.Termination: GameManager.NOTICE_STATE = state
		GameManager.Items.Hook: GameManager.COATRACK_STATE = state
		GameManager.Items.Photos: GameManager.FOTO_STATE = state
		GameManager.Items.Speaker: GameManager.SPEAKER_STATE = state
	GameManager.WINDOW_STATE = state
	GameManager.COATRACK_STATE = state
	SignalManager.emit_signal("scene_changed")
	screen.position = screen_down
	#tween.tween_property(screen, "position", screen_down, screen_speed)

func load_game_data():
	var file_data = _load_text(data_path)
	gamedata = JSON.parse_string(file_data)["items"]

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

func _on_scene_changed() -> void:
	#const AMBIENT___FENSTER__GOOD = preload("res://art/music/Ambient and SFX/Ambient - FENSTER- GOOD.wav")
	#const AMBIENT__FENSTER__BAD = preload("res://art/music/Ambient and SFX/Ambient- FENSTER- BAD.wav")
	#const AMBIENT__FENSTER__START = preload("res://art/music/Ambient and SFX/Ambient- FENSTER- START.wav")
	if GameManager.WINDOW_STATE == "start":
		music_audio_stream_player.stream = load("res://art/music/Ambient and SFX/Ambient- FENSTER- START.wav")
		music_audio_stream_player.play()
		print("change window sound")
	if GameManager.WINDOW_STATE == "good":
		music_audio_stream_player.stream = load("res://art/music/Ambient and SFX/Ambient - FENSTER- GOOD.wav")
		music_audio_stream_player.play()
		print("change window sound")
	if GameManager.WINDOW_STATE == "worst":
		music_audio_stream_player.stream = load("res://art/music/Ambient and SFX/Ambient- FENSTER- BAD.wav")
		music_audio_stream_player.play()
		print("change window sound")


func _on_music_audio_stream_player_finished() -> void:
	music_audio_stream_player.play()
