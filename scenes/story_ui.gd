extends CanvasLayer

@onready var current: Button = $Control/Current
@onready var option1: Button = $Control/Option1
@onready var option2: Button = $Control/Option2

func _ready() -> void:
	SignalManager.connect("load_articles", load_articles)

func load_articles(item_id, item):
	print("loading articles: " + item_id)
	load_article(item_id, item, current, "start")
	load_article(item_id, item, option1, "good")
	load_article(item_id, item, option2, "worst")

func load_article(item_id, item, button, state):
	button.set_content(item_id, item[state]["headline"], item[state]["article"], state)
