extends CharacterBody2D
@export var speed = 300
var direction = Vector2.ZERO
@export var debug = true

enum AnimationDirections{
	DOWN,
	UP,
	SIDE
}

var animation_direction = AnimationDirections.DOWN

func update_direction_animation():
	if direction.x == 1:
		$walking.flip_h = false
		$walking.play("walking_side")
	elif direction.x == -1:
		$walking.flip_h = true
		$walking.play("walking_side")
	elif direction.y == 1:
			$walking.play("walking_down")
	elif direction.y == -1:
			$walking.play("walking_up")
	else:
		$walking.stop()
		$walking.set_animation("idle")
		$walking.set_frame(animation_direction)

# Called when the node enters the scene tree for the first time.
func _ready():
	$walking.set_animation("idle")
	$walking.set_frame(0)
	
	
func _input(event):
	if Input.is_action_just_pressed("player_right"): # RIGHT Player Controls
		direction.x = 1 if direction.x == 0 else direction.x
		if debug:
			print("right")
		if direction.y == 0:
			if debug:
				print("amimate right")
			$walking.flip_h = false
			$walking.play("walking_side")
			animation_direction = AnimationDirections.SIDE
	if Input.is_action_just_released("player_right"):
		if debug:
			print("STOP RIGHT!")
		direction.x = 0 if direction.x == 1 else direction.x
		update_direction_animation()
			
	if Input.is_action_just_pressed("player_left"): # LEFT Player Controls
		direction.x = -1 if direction.x == 0 else direction.x
		if debug:
			print("left")
		if direction.y == 0:
			if debug:
				print("amimate left")
			$walking.flip_h = true
			$walking.play("walking_side")
			animation_direction = AnimationDirections.SIDE
	if Input.is_action_just_released("player_left"):
		if debug:
			print("STOP LEFT!")
		direction.x = 0 if direction.x == -1 else direction.x
		update_direction_animation()
		
	if Input.is_action_just_pressed("player_down"): # DOWN Player Controls
		direction.y = 1 if direction.y == 0 else direction.y
		if debug:
			print("down")
		if direction.x == 0:
			if debug:
				print("amimate down")
			$walking.play("walking_down")
			animation_direction = AnimationDirections.DOWN
	if Input.is_action_just_released("player_down"):
		if debug:
			print("stop! DOWN ;_;")
		direction.y = 0 if direction.y == 1 else direction.y
		update_direction_animation()
		
	if Input.is_action_just_pressed("player_up"): # UP Player Controls
		direction.y = -1 if direction.y == 0 else direction.y
		if debug:
			print("up")
		if direction.x == 0:
			if debug:
				print("amimate up")
			animation_direction = AnimationDirections.UP
			$walking.play("walking_up")

	if Input.is_action_just_released("player_up"):
		if debug:
			print("stop! UP ;_;")
		direction.y = 0 if direction.y == -1 else direction.y
		update_direction_animation()

func _process(delta):
	velocity = direction * speed
	move_and_slide()
