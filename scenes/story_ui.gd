extends CanvasLayer

@onready var current: Button = $Control/Current
@onready var option1: Button = $Control/Option1
@onready var option2: Button = $Control/Option2

func load_articles(item_id, item):
	load_article(item_id, item, current, "start")
	load_article(item_id, item, option1, "good")
	load_article(item_id, item, option2, "worst")

func load_article(item_id, item, button, state):
	button.current_item = item_id
	button.current_state = state
	button.set_headline(item["headline"])
	button.set_article(item["article"])
