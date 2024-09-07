extends Node

# Definiere eine globale Variable für die Punkte
var points: int = 0

		
# Methode zum Hinzufügen von Punkten
func add_point():
	points += 1
	print("Punkte nach Erhöhung: ", points)

# Methode zum Überprüfen der Punkte
func get_points():
	return points
