extends Node
# zäählt die Leben die der Spieler hat
var lives = 3
@export var hearts : Array[Node]

func health():
	lives -= 1
	print(lives)
	for h in 3:
		if (h< lives):
			hearts[h].show()
		else:
			hearts[h].hide()
			
	if (lives == 0):
		get_tree().reload_current_scene()
