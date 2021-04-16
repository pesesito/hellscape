extends Path2D

var speed = 210

func _physics_process(delta):
	$PathFollow2D.set_offset($PathFollow2D.get_offset()+speed*delta)

func _on_playerKiller_area_shape_entered(_area_id, _area, _area_shape, _local_shape):
	Input.action_press("touching something uwu")

func _on_playerKiller_area_shape_exited(_area_id, _area, _area_shape, _local_shape):
	Input.action_release("touching something uwu")
