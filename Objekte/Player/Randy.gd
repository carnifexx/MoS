extends CharacterBody2D
@export var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$walking.set_animation("idle")
	$walking.set_frame(0)
	
	
func _process(delta):  #für jeden frame
	velocity = Vector2.ZERO
	if Input.is_action_pressed("player_right"): # RIGHT Player Controls
		velocity.x += 1 * speed
		print("right")
		$walking.flip_h = false
		$walking.play("walking_side")
		if Input.is_action_pressed("player_down"):
			velocity.y += 1 * speed
			print("DIAG_1RIGHT_2down")
		elif Input.is_action_pressed("player_up"):
			velocity.y -= 1 * speed
			print("DIAG_1RIGHT_2up")
	elif Input.is_action_just_released("player_right"):
		print("stop! RIGHT ;_;")
		$walking.stop()
		$walking.set_animation("idle")
		$walking.set_frame(2)
			
	elif Input.is_action_pressed("player_left"): # LEFT Player Controls
		velocity.x -= 1 * speed
		$walking.flip_h = true
		print("left")
		$walking.play("walking_side")
		if Input.is_action_pressed("player_down"):
			velocity.y += 1 * speed
			print("DIAG_1LEFT_2down")
		elif Input.is_action_pressed("player_up"):
			velocity.y -= 1 * speed
			print("DIAG_1LEFT_2up")
	elif Input.is_action_just_released("player_left"):
		print("stop! LEFT ;_;")
		$walking.stop()
		$walking.set_animation("idle")
		$walking.set_frame(2)
		
	elif Input.is_action_pressed("player_down"): # DOWN Player Controls
		velocity.y += 1
		print("down")
		$walking.play("walking_down")
		$walking.flip_h = true
		if Input.is_action_pressed("player_left"):
			velocity.x -= 1 * speed
			print("DIAG_1DOWN_2left")
		elif Input.is_action_pressed("player_right"):
			velocity.x += 1 * speed
			print("DIAG_1DOWN_2right")
	elif Input.is_action_just_released("player_down"):
		print("stop! DOWN ;_;")
		$walking.stop()
		$walking.set_animation("idle")
		$walking.set_frame(0)
		
	elif Input.is_action_pressed("player_up"): # UP Player Controls
		velocity.y -= 1
		print("up")
		$walking.play("walking_up")
		if Input.is_action_pressed("player_right"):
			velocity.x -= 1 * speed
			print("DIAG_1UP_2right")
		elif Input.is_action_pressed("player_left"):
			velocity.x += 1 * speed
			print("DIAG_1UP_2left")
	elif Input.is_action_just_released("player_up"):
		print("stop! UP ;_;")
		$walking.stop()
		$walking.set_animation("idle")
		$walking.set_frame(1)
		
	position += velocity.normalized() * speed
