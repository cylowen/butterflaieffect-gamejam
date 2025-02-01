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


func _on_timer_timeout() -> void:
	#GameManager.NOTICE_STATE = "worst"
	#SignalManager.emit_signal("change_scene")
	pass
