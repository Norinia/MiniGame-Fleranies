extends Node


func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://Scenen/Level1(wald).tscn")
