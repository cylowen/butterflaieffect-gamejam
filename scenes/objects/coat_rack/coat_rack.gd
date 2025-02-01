extends Node3D

@onready var hook_sprite_start: Sprite3D = $HookSpriteStart
@onready var hook_2_sprite_start: Sprite3D = $Hook2SpriteStart

@onready var hook_sprite_good: Sprite3D = $HookSpriteGood
@onready var hook_2_sprite_good: Sprite3D = $Hook2SpriteGood

@onready var hook_sprite_worse: Sprite3D = $HookSpriteWorse
@onready var hook_2_sprite_worse: Sprite3D = $Hook2SpriteWorse
@onready var hook_2_sprite_worse_2: Sprite3D = $Hook2SpriteWorse2


func _ready() -> void:
	SignalManager.connect("scene_changed", _on_scene_changed)


func _on_scene_changed() -> void:
	
	if GameManager.COATRACK_STATE == "start":
		hook_sprite_start.visible = true
		hook_2_sprite_start.visible = true
		hook_sprite_good.visible = false
		hook_2_sprite_good.visible = false
		hook_sprite_worse.visible = false
		hook_2_sprite_worse.visible = false
		hook_2_sprite_worse_2.visible = false
		print("change coatrack")
		
	if GameManager.COATRACK_STATE == "good":
		hook_sprite_start.visible = false
		hook_2_sprite_start.visible = false
		hook_sprite_good.visible = true
		hook_2_sprite_good.visible = true
		hook_sprite_worse.visible = false
		hook_2_sprite_worse.visible = false
		hook_2_sprite_worse_2.visible = false
		print("change coatrack")
		
	if GameManager.COATRACK_STATE == "worst":
		hook_sprite_start.visible = false
		hook_2_sprite_start.visible = false
		hook_sprite_good.visible = false
		hook_2_sprite_good.visible = false
		hook_sprite_worse.visible = true
		hook_2_sprite_worse.visible = true
		hook_2_sprite_worse_2.visible = true
		print("change coatrack")
