extends Node3D

@export var bubble: PackedScene
@export var box: PackedScene

var xr_interface: XRInterface


func _ready() -> void:
	randomize()
	
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

func _on_bubble_timer_timeout() -> void:
	var new_bubble = bubble.instantiate()
	#TO DO: pass that name ...
	var x_location = randf_range(-0.8, 0.8)
	var y_location = randf_range(0.2, 1.8)
	var z_location = randf_range(-0.8, 0.8)
	add_child(new_bubble)
	new_bubble.global_position = Vector3(x_location,y_location,z_location)


	

func _on_bubble_timer_child_entered_tree(node: Node) -> void:
	pass # Replace with function body.
