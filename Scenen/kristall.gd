extends Area2D

@onready var timer = $Timer
var points=0
@onready var label = %Label
@onready var sound = $sound


func _on_body_entered(body):
	if body is CharacterBody2D:
		timer.start()
		sound.play()
		Gamestate.add_point()
		points= Gamestate.get_points()
		label.text="x"+str(points)



func _on_timer_timeout():
	queue_free()
	
