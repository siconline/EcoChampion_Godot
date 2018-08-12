extends KinematicBody2D

var movement = Vector2(0, 0)
var speed = 600

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right"):
		movement = Vector2(speed, 0)
	elif Input.is_action_just_pressed("ui_left"):
		movement = Vector2(-speed, 0)
	elif Input.is_action_just_released("ui_right") || Input.is_action_just_released("ui_left"):
		movement = Vector2(0, 0)
	
	move_and_collide(movement * delta)
