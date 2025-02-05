extends XRToolsPickable

@onready var start_sprite_3d: Sprite3D = $StartSprite3D
@onready var worst_sprite_3d: Sprite3D = $WorstSprite3D
@onready var good_sprite_3d: Sprite3D = $GoodSprite3D



func _ready() -> void:
	SignalManager.connect("scene_changed", _on_scene_changed)


func _on_scene_changed() -> void:
	
	if GameManager.NOTICE_STATE == "start":
		start_sprite_3d.visible = true
		worst_sprite_3d.visible = false
		good_sprite_3d.visible = false
		print("change sprite")
		
	elif GameManager.NOTICE_STATE == "good":
		start_sprite_3d.visible = false
		worst_sprite_3d.visible = false
		good_sprite_3d.visible = true
		print("change sprite")
		
	elif GameManager.NOTICE_STATE == "worst":
		start_sprite_3d.visible = false
		worst_sprite_3d.visible = true
		good_sprite_3d.visible = false
		print("change sprite")
