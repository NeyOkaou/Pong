extends CharacterBody2D

class_name Racket

var move_speed = 250
var direction = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame
func _process(delta):
	handle_input()  
	apply_movement(delta) 


func handle_input():
	#reset the direction at each frames
	direction = Vector2() 
	#update the direction depending on the player inputs
	if Input.is_action_pressed("UP"):
		direction.y -= 1
	if Input.is_action_pressed("DOWN"):
		direction.y += 1


func apply_movement(delta):
	if direction.length() > 0:
		move_and_collide(direction * move_speed * delta)
