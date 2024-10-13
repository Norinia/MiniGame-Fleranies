extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -750.0
@onready var animation = $animation
var jump_counter =0
@onready var sprung_sound = $SprungSound
@onready var timer = $Timer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func jump():
	#wenn der Spielde den kopf des Gegners Berührt 
	#wird diese Methode aufgerufen und der Spieler springt
	velocity.y = JUMP_VELOCITY
	
	
func ouch(x):
	# bei berührung des Gegners spring der Spieler hoch
	velocity.y = JUMP_VELOCITY
	velocity.x = x	
	#timer wird gestartet
	timer.start()
	# Die Farbe des Spielers wird auf rot geändert
	set_modulate(Color(1,0.3,0.3,0.3))
	
func _physics_process(delta):
	# wenn der Player nicht auf dem Boden steht, wird Gravitation angewendet
	if not is_on_floor():
		velocity.y += gravity * delta

	# Wenn die Springentaste gedrückt wird und der Charakter nicht auf dem Boden steht
	if Input.is_action_just_pressed("jump") and is_on_floor():
		# der Character springt
		velocity.y = JUMP_VELOCITY
		#der jump_counter wird 1 gesetzt
		jump_counter = 1
		#Sprunggereusch wird abgespielt
		sprung_sound.play()
		
	# wenn die Springen Taste nocheinmal gedrückt wird und der jump_counter kleiner als 2 ist
	#diese abfrage ist für einen Doppelsprung verantwortlich
	elif Input.is_action_just_pressed("ui_accept") and jump_counter<2:
		#jump_counter wird 2 gesetzt
		jump_counter = 2
		#der Charakter springt nocheinmal
		velocity.y = JUMP_VELOCITY
		#Sprunggereusch wird abgespielt
		sprung_sound.play()
		
	
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		animation.animation="rennen"
		var isleft=velocity.x<0
		animation.flip_h=isleft
	else:
		velocity.x = move_toward(velocity.x, 0, 12)
		animation.animation="stehen"
		
	if Input.is_action_just_pressed("überspringen "):
		get_tree().change_scene_to_file("res://Scenen/Level1(wald).tscn")


	move_and_slide()

func _on_timer_timeout():
	set_modulate(Color(1,1,1,1))

