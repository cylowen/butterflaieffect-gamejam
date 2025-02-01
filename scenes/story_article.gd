extends Button

func set_headline(headline: String):
	$MarginContainer/Headline.text = headline

func set_article(article: String):
	$MarginContainer2/Article.text = article

func set_content(headline: String, article: String):
	set_headline(headline)
	set_article(article)
