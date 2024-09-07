extends Node
@onready var pause_panel = %PausePanel

func _process(delta):
	var esc_pressed = Input.is_action_just_pressed("esc")
	if (esc_pressed == true):
		get_tree().paused = true
		pause_panel.show()


func _on_button_pressed():
	pause_panel.hide()
	get_tree().paused = false


func _on_reloud_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenen/Level1(wald).tscn")
