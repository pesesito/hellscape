extends Area2D

func _ready():
	$saw.hide()
	$Light2D.enabled = false

# Spini boi
func _process(_delta):
	$saw.rotation += 1

# warning-ignore:unused_argument
func _on_VisibilityNotifier2D_viewport_entered(viewport):
	$Light2D.enabled = true
	$saw.show()

# warning-ignore:unused_argument
func _on_VisibilityNotifier2D_viewport_exited(viewport):
	$Light2D.enabled = false
	$saw.hide()
