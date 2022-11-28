extends CharacterBody2D
#var direction = Vector2.ZERO
var state_machine
@export var speed : float = 100.0
var direction


func _ready():
	state_machine = $Popoi_Tree.get("parameters/playback")
	
func get_input():
	direction = Vector2()
	var current = state_machine.get_current_node()
	if Input.is_action_pressed("player_right"):
		direction.x += 1
		print("popoi right!")
		$Popoi_Sprites.flip_h = false
		state_machine.travel("play_walk_side")
	if Input.is_action_just_released("player_right"):
		state_machine.travel("play_idle_side")
#		direction.x = 0
#		print("stop! popoi RIGHT")
		
	if Input.is_action_pressed("player_left"):
		direction.x -= 1
		print("popoi left!")
		$Popoi_Sprites.flip_h = true
		state_machine.travel("play_walk_side")
	if Input.is_action_just_released("player_left"):
		state_machine.travel("play_idle_side")
#		direction.x = 0
#		print("stop! popoi LEFT")
		
	if Input.is_action_pressed("player_up"):
		direction.y -= 1
		print("popoi up!")
		state_machine.travel("play_walk_up")
	if Input.is_action_just_released("player_up"):
		state_machine.travel("play_idle_up")
#		direction.y = 0
#		print("stop! popoi UP")
		
	if Input.is_action_pressed("player_down"):
		direction.y = 1
		print("popoi down!")
		state_machine.travel("play_walk_down")
	if Input.is_action_just_released("player_down"):
		state_machine.travel("play_idle_down")
#		direction.y = 0
#		print("stop! popoi DOWN")

func _physics_process(delta):
	get_input()
	velocity = direction * speed
	move_and_slide()
	
