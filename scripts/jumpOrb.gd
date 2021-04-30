extends Area2D


func _on_jumpOrb_area_shape_entered(_area_id, _area, _area_shape, _local_shape):
	globals.jumpOrb = true
	$Particles2D.set_emitting(true)
	globals.dont_kill = !globals.dont_kill
func _on_jumpOrb_area_shape_exited(_area_id, _area, _area_shape, _local_shape):
	globals.jumpOrb = false
	$Particles2D.set_emitting(false)
	globals.dont_kill = !globals.dont_kill
