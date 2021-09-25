extends Node2D

var posPortal

func _ready():
	posPortal = $portal2.get_global_position()
	print(posPortal)

# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_teleport1_area_shape_entered(area_id, area, area_shape, local_shape):
	globals.dont_kill = true
	print("Portal 1 Entered")
	globals.teleport_pos = posPortal
	Input.action_press("teleport")
	$portal2/Particles2D.set_emitting(true)

# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_teleport1_area_shape_exited(area_id, area, area_shape, local_shape):
	globals.dont_kill = false
	print("Portal 1 Exit")
	Input.action_release("teleport")
