extends Node2D

signal goal_left
signal goal_right

var score_p1 = 0

var score_p2 = 0

func _on_right_body_entered(body):
	goal_left.emit()
	print("droite")
	score_p2 +=1
	

func _on_left_body_entered(body):
	goal_right.emit()
	print("gauche")
	score_p2+=1
	
func _process(delta):
	pass
	
