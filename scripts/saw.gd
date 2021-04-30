extends Area2D

func _ready():
	$saw.hide()
	$lightPerformance.hide()

# Spini boi
func _process(_delta):
	$saw.rotation += 1

# warning-ignore:unused_argument
func _on_VisibilityNotifier2D_viewport_entered(viewport):
	$saw.show()
	$lightPerformance.show()

# warning-ignore:unused_argument
func _on_VisibilityNotifier2D_viewport_exited(viewport):
	$saw.hide()
	$lightPerformance.hide()
