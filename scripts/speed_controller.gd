extends Node2D

func _ready():
	Engine.time_scale = 1

func _on_Area2D_body_entered(_body):
	globals.dont_kill = !globals.dont_kill
	Engine.time_scale = 0.25

func _on_Area2D_body_exited_(_body):
	globals.dont_kill = !globals.dont_kill
	Engine.time_scale = 1
