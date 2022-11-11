extends Camera2D


var player

func _ready():
	player= get_node("/root/Objekte/Player/Randy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x=player.position.x
	position.y=player.position.y
