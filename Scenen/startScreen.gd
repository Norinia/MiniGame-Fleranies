extends Node

	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenen/startcutScene.tscn")


#func _on_verlassen_pressed():
	


func _on_reloud_pressed():
	get_tree().change_scene_to_file("res://Scenen/Level1(wald).tscn")
