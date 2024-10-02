extends Node

const LEVEL_1 = preload("res://Scenen/Level1(wald).tscn")


func _on_menü_pressed():
	pass # Replace with function body.


func _on_versuch_pressed():
	get_tree().change_scene_to_file("res://Scenen/Level1(wald).tscn")
