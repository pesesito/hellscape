extends Node

func _ready():
	globals.current_level = get_parent().get_filename()
	print(globals.current_level)
