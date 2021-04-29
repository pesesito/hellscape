extends Node

var playerColor = Color(1,1,1,1)

var playerTrailColor = Color(0,0,0,1)

var particles = 5

var lifetime = 30

var performanceMode = false

var gravity = 10
var jump_force = 310
var inverseGravity = false
var touching_something_uwu = false

var deaths = 0
var dont_kill = false

var jumpOrb = false
var dashOrb = false

var current_level = "res://Scenes/Levels/Level 0.tscn"
