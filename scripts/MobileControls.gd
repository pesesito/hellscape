extends CanvasLayer

func _ready():
	if get_tree().get_current_scene().get_filename() == "res://Scenes/MAIN MENU.tscn" or "res://Scenes/MAIN-MENUS/MAIN_MENU_Color.tscn" or "res://Scenes/MAIN-MENUS/MAIN_MENU_Sound.tscn" or "res://Scenes/MAIN-MENUS/MAIN_MENU_trail.tscn":
		$hider.hide()
	else:
		$hider.show()
	
	#if OS.get_name() != "Android":
		#$hider.hide()
	

func _on_left_pressed():
	Input.action_press("ui_left")
func _on_left_released():
	Input.action_release("ui_left")
func _on_right_pressed():
	Input.action_press("ui_right")
func _on_right_released():
	Input.action_release("ui_right")
func _on_jump_pressed():
	Input.action_press("ui_up")
func _on_jump_released():
	Input.action_release("ui_up")
func _on_Pause_pressed():
	get_tree().change_scene("res://Scenes/MAIN MENU.tscn")
