extends KinematicBody2D

onready var animPlayer = $'Sprite/AnimationPlayer'
onready var spritePlayer = $'Sprite'

var movement = Vector2(0, 0)
var speed = 600
var maxStepY = 175

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right"):
		movement = Vector2(speed, 0)
		_checkAnimation()
		spritePlayer.flip_h = false
	elif Input.is_action_just_pressed("ui_left"):
		movement = Vector2(-speed, 0)
		_checkAnimation()
		spritePlayer.flip_h = true
	elif Input.is_action_just_pressed("ui_up"):
		_yStepUP()
	elif Input.is_action_just_pressed("ui_down"):
		_yStepDOWN()
	elif Input.is_action_just_released("ui_right") || Input.is_action_just_released("ui_left"):
		movement = Vector2(0, 0)
		_checkAnimation()
	
	move_and_collide(movement * delta)
	
	

func _checkAnimation():
	if movement.x == 0:
		animPlayer.play('idle')
	else:
		animPlayer.play('run')
func _yStepUP():
	if position.y > -350:
		position.y -= maxStepY
func _yStepDOWN():
	if position.y < 350:
		position.y += maxStepY