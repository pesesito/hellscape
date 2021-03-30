extends Area2D

func _on_VisionOrb_area_shape_entered(_area_id, _area, _area_shape, _self_shape):
	Input.action_press("vision")
	$expolsion.set_emitting(true)
	$Sprite.hide()

func _on_VisionOrb_area_shape_exited(_area_id, _area, _area_shape, _self_shape):
	Input.action_release("vision")

