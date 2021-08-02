extends Node

func _ready():
	pass

func _on_HSlider_value_changed(Value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), Value)

func _on_closeMenuButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MAIN-MENUS/MAIN MENU.tscn")
	globals.menu_back = true

func _on_HSlider2_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
