extends Area2D

func _ready():
	$saw.hide()
	$Light2D.enabled = false
	$sawMaterial.hide()

# Spini boi
func _process(_delta):
	if not Input.is_action_pressed("lowSpec"):
		$saw.rotation += 1
	else:
		$sawMaterial.rotation += 1
	if Input.is_action_just_pressed("lowSpec"):
		$Light2D.enabled = false
		$saw.hide()
		$sawMaterial.show()
	if Input.is_action_just_released("lowSpec"):
		$Light2D.enabled = true
		$saw.show()
		$sawMaterial.hide()

# warning-ignore:unused_argument
func _on_VisibilityNotifier2D_viewport_entered(viewport):
	if not Input.is_action_pressed("lowSpec"):
		$Light2D.enabled = true
		$saw.show()
	else:
		$sawMaterial.show()

# warning-ignore:unused_argument
func _on_VisibilityNotifier2D_viewport_exited(viewport):
	if not Input.is_action_pressed("lowSpec"):
		$Light2D.enabled = false
		$saw.hide()
	else:
		$sawMaterial.hide()
