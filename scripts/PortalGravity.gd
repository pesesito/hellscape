extends Area2D

func _ready():
	globals.inverseGravity = false

func _on_PortalGravity_area_shape_entered(_area_id, _area, _area_shape, _local_shape):
	globals.dont_kill = true
	Input.action_press("gravity")
	globals.inverseGravity = !globals.inverseGravity

func _on_PortalGravity_area_shape_exited(_area_id, _area, _area_shape, _local_shape):
	globals.dont_kill = false
	Input.action_release("gravity")
