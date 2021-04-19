extends Area2D

func _ready():
	$saw.hide()
	$Light2D.set_enabled(false)
	$lightPerformance.hide()
	$Light2D.hide()

# Spini boi
func _process(_delta):
	$saw.rotation += 1

# warning-ignore:unused_argument
func _on_VisibilityNotifier2D_viewport_entered(viewport):
	$saw.show()
	if globals.performanceMode:
		$Light2D.set_enabled(true)
	else:
		$lightPerformance.show()

# warning-ignore:unused_argument
func _on_VisibilityNotifier2D_viewport_exited(viewport):
	$Light2D.enabled = false
	$saw.hide()
	$lightPerformance.hide()
