extends Node3D

@onready var audio_stream_player: AudioStreamPlayer3D = $AudioStreamPlayer
#@export var scene: PackedScene delete if it does not break


func _on_pickable_bubble_picked_up(pickable: Variant) -> void:
	print(pickable)
	print("picked up", self.name)
	#get_tree().change_scene_to_packed(scene)
	SignalManager.emit_signal("bubble_activated", self.name)
	

func _on_pickable_bubble_released(pickable: Variant, by: Variant) -> void:
	print(pickable)
	print("released")


func _on_pickable_bubble_grabbed(pickable: Variant, by: Variant) -> void:
	print(pickable)
	print("grabbed")
	#audio_stream_player.play()
	#get_tree().change_scene_to_packed(scene)
	SignalManager.emit_signal("bubble_activated")


func _on_pickable_bubble_dropped(pickable: Variant) -> void:
	print(pickable)
	print("dropped")
	

func _on_pickable_bubble_action_pressed(pickable: Variant) -> void:
	print("action pressed")
	#audio_stream_player.play()
	#get_tree().change_scene_to_packed(scene)
	SignalManager.emit_signal("bubble_activated", self.name)


func _on_pickable_bubble_highlight_updated(pickable: Variant, enable: Variant) -> void:
	print("bubble highlight updated")


func _on_pickable_bubble_body_entered(body: Node) -> void:
	print("body entered")
	#audio_stream_player.play()
	#get_tree().change_scene_to_packed(scene)
	SignalManager.emit_signal("bubble_activated", self.name)



func _on_pickable_bubble_body_exited(body: Node) -> void:
	print("body exited")
