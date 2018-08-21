extends KinematicBody2D

var movement = Vector2(0, 0)
var speed = 0
var maxSpeed = 500
var playAnim = true

onready var sprite = $Sprite
onready var barrow_Normal = $Barrow_Front_Normal
onready var barrow_Upgrade = $Barrow_Front_Upgrade
onready var pickUps = get_node("../PickUps")
onready var pickUp1 = $PickUps/PickUp1
onready var pickUp2 = $PickUps/PickUp2
onready var pickUp3 = $PickUps/PickUp3
onready var pickUp4 = $PickUps/PickUp4
onready var pickUp5 = $PickUps/PickUp5
onready var pickUp6 = $PickUps/PickUp6
onready var animPlayer = $AnimationPlayer

# pickUp positions
var posPickUps = 20


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	movement = Vector2(speed, 0)
	if playAnim == true:
		animPlayer.play("Run")
		playAnim = false
	#----Player controll----#
	if speed < 0:
		if Input.is_action_just_pressed("ui_right"):
			speed = -speed
			sprite.flip_h = false
			barrow_Normal.flip_h = false
			barrow_Upgrade.flip_h = false
			posPickUps = 20
			#give pickUps 1-6 position.x
			for i in range(1, 7):
				var obj = str("pickUp" , i)
				get(obj).flip_h = false
				get(obj).position.x = posPickUps
				posPickUps = posPickUps + 10
	if speed > 0:
		if Input.is_action_just_pressed("ui_left"):
			speed = -speed
			sprite.flip_h = true
			barrow_Normal.flip_h = true
			barrow_Upgrade.flip_h = true
			posPickUps = -20
			#give pickUps 1-6 position.x
			for i in range(1, 7):
				var obj = str("pickUp" , i)
				get(obj).flip_h = false
				get(obj).position.x = posPickUps
				posPickUps = posPickUps - 10
	if Input.is_action_just_pressed("ui_up"):
		if position.y > -175*2:
			position.y -= 175
	elif Input.is_action_just_pressed("ui_down"):
		if position.y < 175*2:
			position.y += 175
	elif Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down"):
		#movement = Vector2(0, 0)
		#animPlayer.play("Idle")
		pass
	elif Input.is_action_just_released("ui_left"):
		if sprite.flip_h == true:
			# reset the position Pickups on barrow
			posPickUps = 20
	elif Input.is_action_just_released("ui_right"):
		if sprite.flip_h == false:
			# reset the position Pickups on barrow
			posPickUps = -20
	
	move_and_collide(movement * delta)

#----Own Methods----#
func collideObstacleSpeedSlowly():
	if speed > 0:
		speed = 150
	else:
		speed = -150
func collideObstacleSpeedNormal():
	if speed > 0:
		speed = maxSpeed
	else:
		speed = -maxSpeed
func collideObstacleDamage():
	if pickUps.counterPickUps > 0:
		var obj = str("pickUp", pickUps.counterPickUps)
		get(obj).visible = false
		pickUps.counterPickUps -= 1