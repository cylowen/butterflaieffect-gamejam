extends Node3D

@export var bubble: PackedScene
@export var box: PackedScene
@onready var audio_stream_player_2d: AudioStreamPlayer = $AudioStreamPlayer2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@export var json_file_path: String = "res://art/stories/stories.json"  # Path to your JSON file

var xr_interface: XRInterface
var stories: Dictionary
var story_names: Array
var random_names: Array
@export var story: Dictionary

func _ready() -> void:
	randomize()
	SignalManager.connect("bubble_activated", _on_bubble_activated)
	$AudioStreamPlayer2D.connect("finished", _on_audio_finished)
	load_data()
	
func _on_audio_finished():
	audio_stream_player_2d.stream = load("res://art/music/AstralWorldBubble_Ambient01_V2_MZ_loop.wav")
	audio_stream_player_2d.play() 

func load_data():
	var file = FileAccess.open(json_file_path, FileAccess.READ)
	var json_string = file.get_as_text()
	var json = JSON.new()
	var error = json.parse(json_string)
	file.close()

	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_ARRAY:
			print(data_received)
			while (story_names.size() < 50):
				for data in data_received:
					story_names.push_back(data["name"])
					random_names.push_back(data["name"])
					stories[data["name"]] = data
			
			
		else:
			print("Unexpected data")
			return []
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return []

func _on_bubble_activated():
	#audio_stream_player_2d.play()
	audio_stream_player.stream = load("res://art/cues/sfx_bubble_grab.wav")
	audio_stream_player.play()
	var new_bubble = box.instantiate()
	add_child(new_bubble)
	new_bubble.global_position = Vector3(0,0,0)
	#var story_name = random_names[randi_range(0, random_names.size()-1)]
	var story_name = random_names.pop_back()
	random_names.push_front(story_name)
	if story_name:
		var text_path = stories[story_name]["text"] # TO DO check if propery exists
	
		if text_path:
			var text = _load_text(text_path)
			SignalManager.emit_signal("change_text", text)
		else:
			print("no text found", story_name)
		
		var sound_path = stories[story_name]["sound"]
		if sound_path:
			print("sound found", sound_path)
			audio_stream_player_2d.stream = load(sound_path)
			audio_stream_player_2d.play()
		else:
			print("no audio found", story_name)
		
	#if story["category"] == "intro":
	#	shader_material.set_shader_parameter("bubble_color", Color("#fff3db"))
	#elif story["category"] == "journalnote":
	#	shader_material.set_shader_parameter("bubble_color", Color("#895200"))
	#elif story["category"] == "definition":
	#	shader_material.set_shader_parameter("bubble_color", Color("#2763ff"))
	#elif story["category"] == "poem":
	#	shader_material.set_shader_parameter("bubble_color", Color("#9800ac"))
	#elif story["category"] == "mantra":
	#	shader_material.set_shader_parameter("bubble_color", Color("#007258"))
	#elif story["category"] == "book-recommendations":
	#	shader_material.set_shader_parameter("bubble_color", Color("#05679a"))
	#show_message(text)
	

func _load_text(path):
	var text_file = FileAccess.open(path, FileAccess.READ)
	if text_file:
		var text = text_file.get_as_text()
		text_file.close()
		return text
	else:
		print("Error: Could not open text file.", path)

func _on_bubble_timer_timeout() -> void:
	if (story_names.is_empty() == false):
		var story_name = story_names.pop_back()
		story = stories[story_name]
		var new_bubble = bubble.instantiate()
		#TO DO: pass that name ...
		var x_location = randf_range(-0.8, 0.8)
		var y_location = randf_range(0.2, 1.8)
		var z_location = randf_range(-0.8, 0.8)
		add_child(new_bubble)
		new_bubble.global_position = Vector3(x_location,y_location,z_location)
		new_bubble.name = story_name
		stories[new_bubble.name] =  stories[story_name]
		#var pickable_bubble = new_bubble.get_child(0)
		#var collisioninstance = pickable_bubble.get_child(0)
		#var meshinstance = pickable_bubble.get_child(1)
		#var shader_material = meshinstance.get_active_material(0)
		#var pickable_bubble_child = pickable_bubble.get_child(2)
		#var audio_stream_player = new_bubble.get_child(1)
		#var new_material = shader_material.duplicate()
		
			
		#var sound_path = stories[story_name]["sound"]
		#if sound_path:
		#	audio_stream_player.stream = load(sound_path)
		#print(shader_material)
	

func _on_bubble_timer_child_entered_tree(node: Node) -> void:
	pass # Replace with function body.
