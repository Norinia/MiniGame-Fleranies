extends Node2D

var diration = 1	
var SPEED = 40
@onready var animated = $Animated # Spite2D
@onready var timer = $Timer # Timer vom Gegner
@onready var herzen = $"../../Herzen" # das ist die eingene Node für die Leben!!!!!

#alles die Speile
@onready var boden_rechts = $"Boden rechts"
@onready var boden_links = $"Boden links"
@onready var rechts = $rechts
@onready var links = $links
var body = TileMap
@onready var tile_map_2 = $"../../TileMap2"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position.x += diration*SPEED*delta
	if rechts.is_colliding():
		#print("wand")
		diration=-1
		animated.flip_h=true
		#print("rehcts")
	if links.is_colliding():
		#print("Wand")
		diration=1
		animated.flip_h=false
		#print("links")
		
	if not boden_rechts.is_colliding():
		#print("kein boden ")
		diration=-1
		animated.flip_h=true
		##print("kein boden rechts")
		##await get_tree().create_timer(2).timeout
	
	if  not boden_links.is_colliding():
		#print("kein boden")
		diration = 1
		animated.flip_h=false
	position.x += diration*SPEED*delta	
	

func _on_area_2d_body_entered(body):
	#kollision mit dem Spieler
	if body is CharacterBody2D:
		#angaben dazu wo sich der Gegner befindet? 
		var x_delta = body.position.x - position.x
		var y_delta = position.y - body.position.y
		# wenn der Spieler im berich über 30 befindet wird der gegner zerstört
		if(y_delta > 30):
			print("gergner zerstören")
			timer.start()
			body.jump()
			animated.animation="sequashed"
			SPEED =0
	# darunter, also von der Seite, bekommt der Spieler schaden
		elif (y_delta < 30):
			print ("weniger leben")
	#Herzen Node wird aufgerufen 
			herzen.health()
	# sagt in welche richtung der Spieler spruingen soll, anhand dessen von welcher seite der Speiler den Gegner berührt
			if (x_delta > 0):
				body.ouch(500)
			else: 
				body.ouch(-500)

func _on_timer_timeout():
	queue_free()
