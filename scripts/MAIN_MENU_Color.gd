extends Node

func _ready():
	$Control/playerColor/playerColorPicker.set_pick_color(globals.playerColor)
	$Control/trailColor/playerTrailPicker.set_pick_color(globals.playerTrailColor)

func _on_playerColorPicker_color_changed(playerColor):
	print(playerColor)
	globals.playerColor = playerColor

func _on_playerTrailPicker_color_changed(trailColor):
	print(trailColor)
	globals.playerTrailColor = trailColor

func _on_closeMenuButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MAIN MENU.tscn")
