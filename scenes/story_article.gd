extends Button

var current_item: String
var next_state: String

func set_headline(headline: String):
	$MarginContainer/Headline.text = headline

func set_article(article: String):
	$MarginContainer2/Article.text = article

func set_content(item_id: String, headline: String, article: String, state: String):
	set_headline(headline)
	set_article(article)
	current_item = item_id
	next_state = state

func _on_pressed() -> void:
	SignalManager.emit("button_pressed", current_item, next_state)
