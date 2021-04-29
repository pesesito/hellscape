extends Control

var deaths = str(globals.deaths)

func _process(_delta):
	var deathCounter = "Deaths: " + deaths
	$CanvasLayer/RichTextLabel.set_text(deathCounter)
