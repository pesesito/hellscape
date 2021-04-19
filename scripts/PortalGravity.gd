extends Area2D

func _ready():
	globals.inverseGravity = false

func _process(_delta):
	if Input.is_action_just_pressed("gravityDebug"):
		Input.action_press("gravity")
		globals.inverseGravity = !globals.inverseGravity

func _on_PortalGravity_area_shape_entered(_area_id, _area, _area_shape, _local_shape):
	Input.action_press("gravity") 
	globals.inverseGravity = !globals.inverseGravity
	#$CollisionShape2D.set_position(Vector2.)

func _on_PortalGravity_area_shape_exited(_area_id, _area, _area_shape, _local_shape):
	Input.action_release("gravity")
