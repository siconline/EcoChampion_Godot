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
onready var clock = $Node2D/Hud/Clock/Clock_Timer
onready var plasticPlayer = get_node("../Facilities/Plastic/DropPlayer")
onready var paperPlayer = get_node("../Facilities/Paper/DropPlayer")
onready var metalPlayer = get_node("../Facilities/Metal/DropPlayer")
onready var plasticWasteSprite = get_node("../Facilities/Plastic/WasteAnim")
onready var paperWasteSprite = get_node("../Facilities/Paper/WasteAnim")
onready var metalWasteSprite = get_node("../Facilities/Metal/WasteAnim")

# pickUp positions
var posPickUps = 20


func _ready():
	pass
	

func _physics_process(delta):
	
	print(speed)
	
	if speed == maxSpeed || speed == -maxSpeed || speed == slowSpeed || speed == -slowSpeed:
		if animPlayer.get_current_animation() == "Run":
			pass
			#print('is playing run')
		else:
			animPlayer.play("Run")
			#print('run')
			#pass
	elif speed == 100 || speed == -100:
		if animPlayer.get_current_animation() == "Idle":
			pass
		else:
			animPlayer.play("Idle")
	
	
	
	movement = Vector2(speed, 0)
	#----Player controll----#
	#Right INPUT
	if Input.is_action_just_pressed("ui_mouse"):
		if get_global_mouse_position().x > (position.x + 100):
			speed = maxSpeed
		#Set player position out of collision facility
		if facilityCollControll == false:
			position.x = position.x + 10
		#Stop the current animPlayer animation
		animPlayer.stop(true)
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
		#---reset CONTROLL POINT----#
		facilityCollControll = true
		
	if Input.is_action_just_pressed("ui_right"):
		speed = maxSpeed
		#Set player position out of collision facility
		if facilityCollControll == false:
			position.x = position.x + 10
		#Stop the current animPlayer animation
		animPlayer.stop(true)
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
		#---reset CONTROLL POINT----#
		facilityCollControll = true
	#Left INPUT
	if Input.is_action_just_pressed("ui_mouse"):
		if get_global_mouse_position().x < (position.x - 100):
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
	if Input.is_action_just_pressed("ui_mouse"):
		if get_global_mouse_position().y < (position.y - 100):
			if position.y > -175*2:
				position.y -= 175
	elif Input.is_action_just_pressed("ui_down"):
		if position.y < 175*2:
			position.y += 175
	if Input.is_action_just_pressed("ui_mouse"):
		if get_global_mouse_position().y > (position.y + 100):
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
		clock.set_paused(true)
	
	var collision_info = move_and_collide(movement * delta)
	
	#----Check Collision on Facilities----#
	if collision_info:
		if Input.is_action_just_pressed("ui_accept"):
			if plasticPlayer.is_playing():
				plasticWasteSprite.visible = true
			else:
				plasticWasteSprite.visible = false
				if collision_info.collider.name == "Plastic":
					if position.y == -350:
						collideObstacleDamage(0, collision_info.collider.name)
			if paperPlayer.is_playing():
				paperWasteSprite.visible = true
			else:
				paperWasteSprite.visible = false
				if collision_info.collider.name == "Paper":
					if position.y == 0:
						collideObstacleDamage(1, collision_info.collider.name)
			if metalPlayer.is_playing():
				metalWasteSprite.visible = true
			else:
				metalWasteSprite.visible = false
				if collision_info.collider.name == "Metal":
					if position.y == 350:
						collideObstacleDamage(2, collision_info.collider.name)
		#Mouse INPUT	
		if Input.is_action_just_pressed("ui_mouse"):
			if get_global_mouse_position().x > (position.x + 150):
				if plasticPlayer.is_playing():
					plasticWasteSprite.visible = true
				else:
					plasticWasteSprite.visible = false
					if collision_info.collider.name == "Plastic":
						if position.y == -350:
							collideObstacleDamage(0, collision_info.collider.name)
				if paperPlayer.is_playing():
					paperWasteSprite.visible = true
				else:
					paperWasteSprite.visible = false
					if collision_info.collider.name == "Paper":
						if position.y == 0:
							collideObstacleDamage(1, collision_info.collider.name)
				if metalPlayer.is_playing():
					metalWasteSprite.visible = true
				else:
					metalWasteSprite.visible = false
					if collision_info.collider.name == "Metal":
						if position.y == 350:
							collideObstacleDamage(2, collision_info.collider.name)
		
		if facilityCollControll == true:
			if speed > 0:
				speed = 100
			else:
				speed = -100
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
			if pickUpName == "Plastic":
				plasticPlayer.play("Waste_IN")
				hud.scoreCount += 100
			elif pickUpName == "Metal":
				metalPlayer.play("Waste_IN")
				hud.scoreCount += 50
			else:
				paperPlayer.play("Waste_IN")
				hud.scoreCount += 25
		else:
			if pickUpIndex == 9 && pickUpName == "Value":
				pass
			else:
				if position.y == -350:
					plasticPlayer.play("Waste_OUT")
				elif position.y == 0:
					paperPlayer.play("Waste_OUT")
				elif position.y == 350:
					metalPlayer.play("Waste_OUT")
				print('Wrong Item')
		#----remove the last pickup----#
		pickUps.counterPickUps -= 1
		pickUps.pickUpTypBarrow.remove(pickUps.pickUpTypBarrow.size()-1)