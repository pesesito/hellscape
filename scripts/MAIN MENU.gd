extends Node

func _ready():
	$Control/settings.hide()

func _on_startButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Levels/Level 0.tscn")

func _on_settingsButton_pressed():
	$Control/title.hide()
	$Control/startButton.hide()
	$Control/settingsButton.hide()
	$Control/settings.show()
	

func _on_fullscreenButton_toggled(button_pressed):
	if button_pressed == true:
		OS.window_fullscreen = !OS.window_fullscreen
	else:
		OS.window_fullscreen = !OS.window_fullscreen

func _on_closemenuButton_pressed():
	$Control/title.show()
	$Control/startButton.show()
	$Control/settingsButton.show()
	$Control/settings.hide()

func _on_exitButton_pressed():
	get_tree().quit()

func _on_colorPicker_pressed():
	get_tree().change_scene("res://Scenes/MAIN_MENU_Color.tscn")
