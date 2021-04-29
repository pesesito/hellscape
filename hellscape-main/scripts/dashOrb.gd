extends Area2D


func _on_jumpOrb_area_shape_entered(_area_id, _area, _area_shape, _local_shape):
	globals.dont_kill = true
	$Particles2D.set_emitting(true)
	globals.dashOrb = true


func _on_dashOrb_area_shape_exited(_area_id, _area, _area_shape, _local_shape):
	globals.dont_kill = false
	$Particles2D.set_emitting(false)
