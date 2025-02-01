extends CanvasLayer

@onready var current: Button = $Control/Current
@onready var option1: Button = $Control/Option1
@onready var option2: Button = $Control/Option2

func _ready() -> void:
	current.set_content("Arbeiterklasse von KI ersetzt", "Traurig, wa?")
	option1.set_content("Führungsebene von KI ersetzt", "Weniger traurig!")
	option2.set_content("Irgendwas Drittes was den- noch voll schlimm sein is", "The schlimmest.")
