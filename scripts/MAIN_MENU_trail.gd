extends Control

func _ready():
	var lenght = str(globals.lifetime)
	var particles = str(globals.particles)
	
	$traillenght/lenght.set_text(lenght)
	$trailparticles/particles.set_text(particles)

# warning-ignore:unused_argument
func _on_lenght_text_changed(textLenght):
	 globals.lifetime = textLenght

# warning-ignore:unused_argument
func _on_particles_text_changed(textParticles):
	globals.particles = textParticles

func _on_closeMenuButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MAIN MENU.tscn")

func _on_defaultSettings_pressed():
	$traillenght/lenght.set_text("5")
	$trailparticles/particles.set_text("30")
	globals.lifetime = 5
	globals.particles = 30
