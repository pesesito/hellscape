extends Node

func _ready():
	$Control/settings.hide()
	$Control/title.show()
	$Control/startButton.show()
	$Control/settingsButton.show()
	$Control/exitButton.show()
	
	if globals.menu_back == true:
		settings()
		globals.menu_back = false

func _process(_delta):
	if globals.performanceMode:
		$Lights.hide()
	if not globals.performanceMode:
		$Lights.show()

func _on_startButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(globals.current_level)

func _on_settingsButton_pressed():
	settings()

func settings():
	$Control/title.hide()
	$Control/startButton.hide()
	$Control/settingsButton.hide()
	$Control/settings.show()
	$Control/levelSelector.hide()

func _on_fullscreenButton_toggled(button_pressed):
	match(button_pressed):
		true:
			OS.window_fullscreen = true
		false:
			OS.window_fullscreen = false

func _on_closemenuButton_pressed():
	$Control/title.show()
	$Control/startButton.show()
	$Control/settingsButton.show()
	$Control/settings.hide()
	$Control/levelSelector.show()

func _on_exitButton_pressed():
	get_tree().quit()

func _on_colorPicker_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MAIN-MENUS/MAIN_MENU_Color.tscn")

func _on_trailButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MAIN-MENUS/MAIN_MENU_trail.tscn")

func _on_performanceMode_toggled(performanceMode):
	match(performanceMode):
		true:
			globals.performanceMode = true
		false:
			globals.performanceMode = false

func _on_levelSelector_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Levels/Level selector.tscn")

func _on_audioButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MAIN-MENUS/MAIN_MENU_Sound.tscn")

func _on_musicButton_toggled(button_pressed):
	match(button_pressed):
		true:
			globals.music = true
		false:
			globals.music = false
