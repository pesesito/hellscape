extends Area2D

var jump = false

func _on_jumpGravity_area_shape_entered(_area_id, _area, _area_shape, _local_shape):
	Input.action_press("gravity")
	globals.inverseGravity = !globals.inverseGravity
	$orb/Particles2D.set_emitting(true)
	globals.dont_kill = !globals.dont_kill
	jump = true
	$Timer.start()

func _on_jumpGravity_area_shape_exited(_area_id, _area, _area_shape, _local_shape):
	Input.action_release("gravity")
	globals.jumpOrb = false
	$orb/Particles2D.set_emitting(false)
	globals.dont_kill = !globals.dont_kill
	jump = false

func _process(_delta):
	if jump == true:
		globals.jumpOrb = true
