extends Path2D

var speed = 210

func _physics_process(delta):
	$PathFollow2D.set_offset($PathFollow2D.get_offset()+speed*delta)
