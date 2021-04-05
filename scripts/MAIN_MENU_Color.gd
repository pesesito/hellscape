extends Node

func _on_playerColorPicker_color_changed(playerColor):
	globals.playerColor = playerColor


func _on_playerTrailPicker_color_changed(trailColor):
	globals.playerTrailColor = trailColor

func _on_closeMenuButton_pressed():
	get_tree().change_scene("res://Scenes/MAIN MENU.tscn")
