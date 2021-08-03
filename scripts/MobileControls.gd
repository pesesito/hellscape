extends CanvasLayer

func _ready():
	#if OS.get_name() != "Android":
		#$hider.hide()
	pass
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
