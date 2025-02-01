extends CanvasLayer


func _ready() -> void:
	SignalManager.connect("change_scene", _on_scene_changed)


func _on_scene_changed() -> void:
	if GameManager.NOTICE_STATE == "start":
		$ControlStart.visible = true
		$ControlGood.visible = false
		$ControlWorse.visible = false
	if GameManager.NOTICE_STATE == "good":
		$ControlStart.visible = false
		$ControlGood.visible = true
		$ControlWorse.visible = false
	if GameManager.NOTICE_STATE == "worst":
		$ControlStart.visible = false
		$ControlGood.visible = false
		$ControlWorse.visible = true
	else:
		print("could not change state of notice")
