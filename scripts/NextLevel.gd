extends Area2D

export(String, FILE) var next_world

func _on_Next_level_body_entered(_body):
# warning-ignore:return_value_discarded
	get_tree().change_scene(next_world)
