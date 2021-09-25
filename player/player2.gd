extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
export var speed = 25
export var max_speed = 200
var gravity = globals.gravity
var jump_force = -globals.jump_force
export var mult_jump_wall = 1.2
var jump_force_wall = -300 * mult_jump_wall
export var max_fall_speed = 2000
var zoom = 0.25

var dead = false

var nextlevel = false

var Debug = false

func _ready():
	# Initial Stuff
	$Collision.disabled = false
	dead = false
	nextlevel = false
	
	#Player Colors
	$player.modulate = globals.playerColor
	$particles/death.modulate = globals.playerColor
	$particles/movement.modulate = globals.playerTrailColor
	$particles/cute_particles_uwu/rightParticles.modulate = globals.playerTrailColor
	$particles/cute_particles_uwu/leftParticles.modulate = globals.playerTrailColor
	
	#Trail config
	if int(globals.particles) >= 9999:
		globals.particles = 9999
	$particles/movement.set_lifetime(int(globals.lifetime))
	$particles/movement.set_amount(int(globals.particles))
	
	
	#Gravity
	gravity = globals.gravity
	jump_force = -globals.jump_force
	$RayCastDownLeft.set_enabled(true)
	$RayCastDownRight.set_enabled(true)
	$RayCastDownLeftUp.set_enabled(false)
	$RayCastDownRightUp.set_enabled(false)

	globals.dashOrb = false

func _process(_delta):
	
	# Check if you have debug on or off, and if you are dead
	
	if Input.is_action_just_pressed("debug"):
		Debug = true
	if Input.is_action_just_pressed("dissableDebug"):
		Debug = false
		$Collision.disabled = false
		$Area2D/CollisionShape2D.disabled = false
	
	if Input.is_action_just_pressed("lowSpec"):
		globals.performanceMode = true
	
	if Input.is_action_just_pressed("main_menu"):
# warning-ignore:return_value_discarded
		globals.deaths += 1
		get_tree().change_scene("res://Scenes/MAIN-MENUS/MAIN MENU.tscn")

	if Input.is_action_just_pressed("teleport"):
		self.set_global_position(globals.teleport_pos)
		print("Teleported to: " + str(globals.teleport_pos))

func _physics_process(_delta):
	
	_particles()
	
	#Gravity Inversion
	
	if Input.is_action_pressed("gravity"):
		match(globals.inverseGravity):
			true:
				gravity = -globals.gravity
				jump_force = globals.jump_force
				$RayCastDownLeft.set_enabled(false)
				$RayCastDownRight.set_enabled(false)
				$RayCastDownLeftUp.set_enabled(true)
				$RayCastDownRightUp.set_enabled(true)
			false: 
				gravity = globals.gravity
				jump_force = -globals.jump_force
				$RayCastDownLeft.set_enabled(true)
				$RayCastDownRight.set_enabled(true)
				$RayCastDownLeftUp.set_enabled(false)
				$RayCastDownRightUp.set_enabled(false)
	
	# Player physics code
	
	if not Debug:
		motion.y += gravity
		motion.y = min(motion.y, max_fall_speed)
		print(motion.y)
	
	# Motion code
	
	if not dead and not nextlevel:
		if Input.is_action_pressed("ui_right") and not dead:
			motion.x += speed
			motion.x = min(motion.x, max_speed)

		elif Input.is_action_pressed("ui_left") and not dead:
			motion.x += -speed
			motion.x = max(motion.x, -max_speed)
		
		if Debug == true and not _pressing_movement():
			motion.x = 0
		
		if _is_in_floor() or _is_in_ceiling() or globals.jumpOrb == true:
			if Input.is_action_just_pressed("ui_up"):
				if globals.jumpOrb == true:
					motion.y = jump_force * 1.5
				else:
					motion.y = jump_force
				
		if not _pressing_movement() and not dead:
			if not dead:
				if is_on_floor() or _is_in_ceiling():
					motion.x = lerp(motion.x, 0, 0.25)
				if not is_on_floor():
					motion.x = lerp(motion.x, 0, 0.05)
	
	if _next_to_wall() and not is_on_floor():
		if $RayCastLeft.is_colliding() and Input.is_action_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
			motion.y = lerp(motion.y, 0, 0.05)
			if Input.is_action_just_pressed("ui_up"):
				motion.y = jump_force
				motion.x += speed * 6.9
		elif $RayCastRight.is_colliding() and Input.is_action_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
			if Input.is_action_just_pressed("ui_up"):
				motion.y = jump_force
				motion.x += -speed * 6.9
		
	if Input.is_action_pressed("ui_cancel"):
# warning-ignore:return_value_discarded
			get_tree().reload_current_scene()
	
	# Debug Code
	
	if Debug == true:
		$Collision.disabled = true
		$Area2D/CollisionShape2D.disabled = true
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -200
		elif Input.is_action_just_pressed("ui_down"):
			motion.y = 200
		elif not _pressing_movement_vertical():
			motion.y = 0
	
	motion = move_and_slide(motion, UP)

# Input and collition detection for wall jump 

func _pressing_movement():
	return Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")

func _pressing_movement_vertical():
	return Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down")

func _next_to_wall():
	return $RayCastLeft.is_colliding() or $RayCastRight.is_colliding()

func _is_in_floor():
	return $RayCastDownLeft.is_colliding() or $RayCastDownRight.is_colliding()

func _is_in_ceiling():
	return $RayCastDownLeftUp.is_colliding() or $RayCastDownRightUp.is_colliding()

# warning-ignore:function_conflicts_variable
func _nextlevel():
	dead = false
	nextlevel = true
	$Colision.disabled = true
	$CollisionShape2D.disabled = false
	$AnimatedSprite.visible = false
	$NextLevel.visible = true

func _death():
	motion.y = globals.jump_force * 1.5
	dead = true
	Input.action_press("dead")
	$particles/death.set_emitting(true)
	$Timers/deathTimer.start()
	$Light2D.energy = 0.25

func _on_Timer_timeout():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	$particles/death.set_emitting(false)
	Input.action_release("dead")

func _reqs():
	return not globals.dont_kill

func _on_Area2D_area_shape_entered(_area_id, _area, _area_shape, _self_shape):
	if _reqs() and not dead:
		_death()
		globals.deaths += 1

func _particles():
	if $RayCastLeft.is_colliding():
		$particles/cute_particles_uwu/leftParticles.set_emitting(true)
		if is_on_floor() or is_on_ceiling():
			$particles/cute_particles_uwu/leftParticles.set_emitting(false)
	else:
		$particles/cute_particles_uwu/leftParticles.set_emitting(false)
	
	if $RayCastRight.is_colliding():
		$particles/cute_particles_uwu/rightParticles.set_emitting(true)
		if is_on_floor() or is_on_ceiling():
			$particles/cute_particles_uwu/rightParticles.set_emitting(false)
	else:
		$particles/cute_particles_uwu/rightParticles.set_emitting(false)
	
	
