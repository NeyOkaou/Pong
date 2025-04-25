extends CharacterBody2D

var ball : CharacterBody2D

func _ready():
	ball = get_parent().get_node("Ball")
	
func _physics_process(delta):
	global_position.y = ball.global_position.y
