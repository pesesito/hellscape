extends Node2D

var death0 = load("res://sounds/death0.wav")
var death1 = load("res://sounds/death1.wav")
var death2 = load("res://sounds/death2.wav")
var death3 = load("res://sounds/death3.wav")
var death_sound = [death0, death1, death2, death3]

var check = true

func _process(_delta):
	if globals.dead == true:
		while check == true:
			var n = rand_range(0, 3)
			n = round(n)
			$AudioStreamPlayer.stream = death_sound[n]
			$AudioStreamPlayer.play()
			$AudioStreamPlayer.volume_db = -24
			check = false
