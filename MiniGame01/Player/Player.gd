extends KinematicBody2D

var movement = Vector2(0, 0)
var speed = 0
var maxSpeed = 500
var slowSpeed = 150
var facilityCollControll = true

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
onready var hud = $Node2D/Hud

# pickUp positions
var posPickUps = 20


func _ready():
	pass
	

func _physics_process(delta):
	
	if speed == maxSpeed || speed == -maxSpeed || speed == slowSpeed || speed == -slowSpeed:
		if animPlayer.is_playing():
			pass
			#print('is playing run')
		else:
			animPlayer.play("Run")
			#print('run')
	elif speed == 100:
		if animPlayer.is_playing():
			pass
			#print('is playing idle')
		else:
			animPlayer.play("Idle")
			#print('idle')
	
	
	
	movement = Vector2(speed, 0)
	#----Player controll----#
	if Input.is_action_just_pressed("ui_right"):
		speed = maxSpeed
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
	if Input.is_action_just_pressed("ui_left"):
		speed = -maxSpeed
		#Set player position out of collision facility
		if facilityCollControll == false:
			position.x = position.x - 10
		#Stop the current animPlayer animation
		animPlayer.stop(true)
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
		#---reset CONTROLL POINT----#
		facilityCollControll = true
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
	elif Input.is_action_just_pressed("ui_cancel"):
		hud.pausemenu.visible = true
		get_tree().set_pause(true)
	
	var collision_info = move_and_collide(movement * delta)
	
	#----Check Collision on Facilities----#
	if collision_info:
		if Input.is_action_just_pressed("ui_accept"):
			if collision_info.collider.name == "Plastic":
				if position.y == -350:
					collideObstacleDamage(0, collision_info.collider.name)
			elif collision_info.collider.name == "Paper":
				if position.y == 0:
					collideObstacleDamage(1, collision_info.collider.name)
			elif collision_info.collider.name == "Metal":
				if position.y == 350:
					collideObstacleDamage(2, collision_info.collider.name)
		
		if facilityCollControll == true:
			speed = 100
			animPlayer.stop(true)
			facilityCollControll = false

#----Own Methods----#
func collideObstacleSpeedSlowly():
	if speed > 0:
		speed = slowSpeed
	else:
		speed = -slowSpeed
func collideObstacleSpeedNormal():
	if speed > 0:
		speed = maxSpeed
	else:
		speed = -maxSpeed
		
func collideObstacleDamage(pickUpIndex, pickUpName):
	if pickUps.counterPickUps > 0:
		var obj = str("pickUp", pickUps.counterPickUps)
		get(obj).visible = false
		#----check the item on weelbarrow----#
		if pickUps.pickUpTypBarrow[pickUps.pickUpTypBarrow.size()-1] == pickUpIndex:
			print(pickUpName)
		else:
			if pickUpIndex == 9 && pickUpName == "Value":
				pass
			else:
				print('Wrong Item')
		#----remove the last pickup----#
		pickUps.counterPickUps -= 1
		pickUps.pickUpTypBarrow.remove(pickUps.pickUpTypBarrow.size()-1)