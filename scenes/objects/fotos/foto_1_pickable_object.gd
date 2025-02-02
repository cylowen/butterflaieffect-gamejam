extends XRToolsPickable

@onready var foto_bad: Sprite3D = $foto_bad
@onready var foto_good: Sprite3D = $foto_good
@onready var foto_worst: Sprite3D = $foto_worst

func _ready() -> void:
	SignalManager.connect("scene_changed", _on_scene_changed)


func _on_scene_changed() -> void:

	if GameManager.FOTO_STATE == "start":
		foto_bad.visible = true
		foto_good.visible = false
		foto_worst.visible = false
		print("change foto1")
		
	if GameManager.FOTO_STATE == "good":
		foto_bad.visible = false
		foto_good.visible = true
		foto_worst.visible = false
		print("change foto1")
		
	if GameManager.FOTO_STATE == "worst":
		foto_bad.visible = false
		foto_good.visible = false
		foto_worst.visible = true
		print("change foto1")
