extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
export var speed = 25
export var max_speed = 200
export var gravity = 10
export var jump_force = -300
export var mult_jump_wall = 1.2
var jump_force_wall = -300 * mult_jump_wall
export var max_fall_speed = 750
var zoom = 0.25

var dead = false

var nextlevel = false

var Debug = false

func _ready():
	# Initial Variales
	$Collision.disabled = false
	dead = false
	nextlevel = false
	

func _process(_delta):
	
	# Check if you have debug on or off, and if you are dead
	
	if Input.is_action_just_pressed("debug"):
		Debug = true
	if Input.is_action_just_pressed("dissableDebug"):
		Debug = false
		$Colision.disabled = false
		$Area2D/CollisionShape2D.disabled = false
		
	if Input.is_action_just_pressed("vision"):
		print("bruh")
		vision()
	if Input.is_action_just_pressed("speed"):
		speed()
		print("bruh1")

func _physics_process(_delta):
	
	# Player physics code
	
	if Debug == false:
		motion.y += gravity
		motion.y = min(motion.y, max_fall_speed)
	
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
		
		if _is_in_floor():
			if Input.is_action_just_pressed("ui_up"):
				motion.y = jump_force
		if not _pressing_movement() and not dead:
			if is_on_floor():
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

# warning-ignore:function_conflicts_variable
# warning-ignore:function_conflicts_variable
func nextlevel():
	dead = false
	nextlevel = true
	$Colision.disabled = true
	$CollisionShape2D.disabled = false
	$AnimatedSprite.visible = false
	$NextLevel.visible = true

func death():
	motion.y = -300
	dead = true
	$particles/death.set_emitting(true)
	$deathTimer.start()
	$Light2D.energy = 2

func _on_Timer_timeout():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	$particles/death.set_emitting(false)

func _on_Area2D_area_shape_entered(_area_id, _area, _area_shape, _self_shape):
# warning-ignore:return_value_discarded
	if not Input.is_action_pressed("vision"):
		if not Input.is_action_pressed("speed"):
			if not dead:
				death()

# Vision effect code

func vision():
	$visionTimer.start()
	$Camera2D.zoom.x = 0.5
	$Camera2D.zoom.y = 0.5
	$Light2D.scale.x = 7
	$Light2D.scale.y = 7
	$Light2D.energy = 1.1

func _on_visionTimer_timeout():
	print(zoom)
	print("timeout")
	$Camera2D.zoom.x = 0.25
	$Camera2D.zoom.y = 0.25
	$Light2D.scale.x = 5
	$Light2D.scale.y = 5
	$Light2D.energy = 1

# warning-ignore:function_conflicts_variable
func speed():
	speed = speed * 1.5
	max_speed = max_speed * 1.5
	jump_force = jump_force * 1.5
	jump_force_wall = jump_force_wall * 1.5

func _on_speedTimer_timeout():
	speed = 25
	max_speed = 200
	jump_force = -300
	jump_force_wall = -300 * mult_jump_wall
