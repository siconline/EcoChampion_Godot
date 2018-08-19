extends KinematicBody2D

var movement = Vector2(0, 0)
var speed = 400

onready var sprite = $Sprite
onready var animPlayer = $AnimationPlayer

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right"):
		movement = Vector2(speed, 0)
		animPlayer.play("Run")
		sprite.flip_h = false
	elif Input.is_action_just_pressed("ui_left"):
		movement = Vector2(-speed, 0)
		animPlayer.play("Run")
		sprite.flip_h = true
	elif Input.is_action_just_pressed("ui_up"):
		if position.y > -175*2:
			position.y -= 175
	elif Input.is_action_just_pressed("ui_down"):
		if position.y < 175*2:
			position.y += 175
	elif Input.is_action_just_released("ui_right") || Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down"):
		movement = Vector2(0, 0)
		animPlayer.play("Idle")
	
	move_and_collide(movement * delta)