extends Area2D
@onready var timer = $Timer



func _on_body_entered(body):
	if body is CharacterBody2D:
		timer.start()
		#get_tree().reload.current_scene()
		


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenen/gameOver.tscn")
# das konnte nicht in func_on_body_entered weil das ein in Signal ist und
# das wohl nicht geht
