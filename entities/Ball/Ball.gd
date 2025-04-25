extends CharacterBody2D

@onready var ball = $Ball

var initial_ball_speed = 500
var speed_commulator  = 50
var ball_speed = initial_ball_speed

var hit_counter = 0
var max_hit_counter = 12
var direction = Vector2()

func _ready():
	#randomize the seed for the generated numbers
	randomize()
	set_start_direction()



func set_start_direction():
	#decide the direction the ball will go in first
	var random_x = 0
	if randi()% 10 < 5:
		random_x = 1
	else:
		random_x = -1
	direction = Vector2(random_x,randf_range(-1, 1))
	direction = direction.normalized() * ball_speed
	
func _physics_process(delta):
	var collision : KinematicCollision2D = move_and_collide(direction * delta)
	#make the ball bounce when it touch the wall
	if collision:
		direction = direction.bounce(collision.get_normal())
		if collision.get_collider().is_in_group("joueur"):
			if hit_counter<12:
				ball_speed += 80
				direction = direction.normalized() * ball_speed
				hit_counter+=1
	#make the ball bounce when it touch a racket
	


