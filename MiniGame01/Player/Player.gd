extends KinematicBody2D

var movement = Vector2(0, 0)
var speed = 0
var maxSpeed = 500
var slowSpeed = 150
var facilityCollControll = true
# pickUp positions
var posPickUps = 20
#POWERUP CONTROLL
var speedUp = false
var toolbox = false
var playerControll = false
#BOOST VALUES
var boost = true
var boostload = 0
#SOUNDS
var stepTimer = false
#MousePressed variable
var mousePressed = false

onready var methods = get_node("../../Methods")

onready var sprite = $Sprite
var spritetexture = preload('res://MiniGame01/Player/Textures/T_CharacterRun8_b_verkl.png')
onready var barrow_front_normal = $Barrow_Front_Normal
onready var barrow_front_upgrade = $Barrow_Front_Upgrade
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
onready var toolboxPUP = $PowerUps/PowerUp1
onready var speedPUP = $PowerUps/PowerUp2
onready var npc = get_node("../Npc")



func _ready():
	randomize()
	

func _physics_process(delta):
	
	if speed > 100:
		$CollisionShape2D.position.x = 27
	if speed < -100:
		$CollisionShape2D.position.x = -27
	
	if speed == maxSpeed || speed == -maxSpeed || speed == slowSpeed || speed == -slowSpeed || speed == maxSpeed*2 || speed == -maxSpeed*2:
		if animPlayer.get_current_animation() == "Run":
			playSoundSteps()
			pass
			#print('is playing run')
		else:
			animPlayer.play("Run")
			#print('run')
			#pass
	elif speed == 100 || speed == -100 || speed == 0:
		if animPlayer.get_current_animation() == "Idle":
			stopSoundSteps()
		else:
			animPlayer.play("Idle")
	movement = Vector2(speed, 0)
	if playerControll == true:
		#BOOST CONTROLL
		if hud.boostCounter > 1:
			if Input.is_action_just_pressed("ui_boost"):
				if boost == true:
					playSoundSpeedUp()
					speed = speed * 2
					hud.boostCounter -= 1
					if speed > 0:
						$Particles2DR.emitting = true
					if speed < 0:
						$Particles2DL.emitting = true
					boost = false
					$TimerBoost.start()
			elif Input.is_action_just_released("ui_boost"):
				#speed = maxSpeed
				pass
		#RIGHT INPUT
		if Input.is_action_just_pressed("ui_mouse"):
			if get_global_mouse_position().x > (position.x + 100):
				#M001
				methods.pressedMouseForDirection(false, true)
		if Input.is_action_just_pressed("ui_right"):
			#M001
			methods.pressedMouseForDirection(false, true)
			#STOP ANIMATION SPEEDUP
			$Particles2DR.emitting = false
			$Particles2DL.emitting = false
		#LEFT INPUT
		if Input.is_action_just_pressed("ui_mouse"):
			if get_global_mouse_position().x < (position.x - 100):
				#M001
				methods.pressedMouseForDirection(true, false)
		if Input.is_action_just_pressed("ui_left"):
			#M001
			methods.pressedMouseForDirection(true, false)
			#STOP ANIMATION SPEEDUP
			$Particles2DR.emitting = false
			$Particles2DL.emitting = false
			
		if Input.is_action_just_pressed("ui_up"):
			if position.y > -175*2:
				position.y -= 175

		if Input.is_action_just_pressed("ui_down"):
			if position.y < 175*2:
				position.y += 175
	
		if Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down"):
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
		#M004
		methods.stopRunAndSetSpeed()
		if Input.is_action_just_pressed("ui_accept"):
			if plasticPlayer.is_playing():
				plasticWasteSprite.visible = true
			else:
				plasticWasteSprite.visible = false
				if collision_info.collider.name == "Plastic":
					if position.y == -350:
						#M003
						methods.collideObstacleDamage(0, collision_info.collider.name)
			if paperPlayer.is_playing():
				paperWasteSprite.visible = true
			else:
				paperWasteSprite.visible = false
				if collision_info.collider.name == "Paper":
					if position.y == 0:
						#M003
						methods.collideObstacleDamage(1, collision_info.collider.name)
			if metalPlayer.is_playing():
				metalWasteSprite.visible = true
			else:
				metalWasteSprite.visible = false
				if collision_info.collider.name == "Metal":
					if position.y == 350:
						#M003
						methods.collideObstacleDamage(2, collision_info.collider.name)
		#Mouse INPUT	
		if Input.is_action_just_pressed("ui_mouse"):
			if get_global_mouse_position().x > (position.x + 150):
				if plasticPlayer.is_playing():
					plasticWasteSprite.visible = true
				else:
					plasticWasteSprite.visible = false
					if collision_info.collider.name == "Plastic":
						if position.y == -350:
							#M003
							methods.collideObstacleDamage(0, collision_info.collider.name)
				if paperPlayer.is_playing():
					paperWasteSprite.visible = true
				else:
					paperWasteSprite.visible = false
					if collision_info.collider.name == "Paper":
						if position.y == 0:
							#M003
							methods.collideObstacleDamage(1, collision_info.collider.name)
				if metalPlayer.is_playing():
					metalWasteSprite.visible = true
				else:
					metalWasteSprite.visible = false
					if collision_info.collider.name == "Metal":
						if position.y == 350:
							#M003
							methods.collideObstacleDamage(2, collision_info.collider.name)
	
	if Input.is_action_just_pressed("ui_mouse"):
		mousePressed = true
	if Input.is_action_just_released("ui_mouse"):
		mousePressed = false

	#CONTROLL VISIBILITY POWERUPS AT BARROW#
	if speedUp == true:
		speedPUP.visible = true
		npc.playerSpeedUp = true
	else:
		speedPUP.visible = false
	if toolbox == true:
		toolboxPUP.visible = true
		npc.playerToolbox = true
	else:
		toolboxPUP.visible = false

func boost_Button_activate():
	if playerControll == true:
		#BOOST CONTROLL
		if hud.boostCounter > 1:
			if boost == true:
				speed = speed * 2
				hud.boostCounter -= 1
				if speed > 0:
					$Particles2DR.emitting = true
				if speed < 0:
					$Particles2DL.emitting = true
				boost = false
				$TimerBoost.start()

func _on_TimerBoost_timeout():
	boost = true
	$Particles2DR.emitting = false
	$Particles2DL.emitting = false
	if speed > 100 || speed < 0:
		if speed > 0:
			speed = maxSpeed
		if speed < 0:
			speed = -maxSpeed
	#print("timout")
	
#SOUNDS----------------------#
func playSoundSteps():
	if speed == maxSpeed*2 || speed == -maxSpeed*2:
		$SoundSteps/Timer.wait_time = 0.2
	else:
		$SoundSteps/Timer.wait_time = 0.4
	if stepTimer == false:
		$SoundSteps/Timer.start()
		stepTimer = true
		
func stopSoundSteps():
	$SoundSteps.stop()

func _on_Timer_timeout():
	var randomSound = randi()%10
	var steps = [load("res://Sounds/FootSteps/S_Step01.wav"), load("res://Sounds/FootSteps/S_Step02.wav"), load("res://Sounds/FootSteps/S_Step03.wav"), load("res://Sounds/FootSteps/S_Step04.wav"), load("res://Sounds/FootSteps/S_Step05.wav"), load("res://Sounds/FootSteps/S_Step06.wav"), load("res://Sounds/FootSteps/S_Step07.wav"), load("res://Sounds/FootSteps/S_Step08.wav"), load("res://Sounds/FootSteps/S_Step09.wav"), load("res://Sounds/FootSteps/S_Step10.wav")]
	if $SoundSteps.is_playing() == false:
		$SoundSteps.stream = steps[randomSound]
		$SoundSteps.play()
	stepTimer = false

func playSoundSpeedUp():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_Boost.wav")
	player.play()


func _on_Button_Ground_pressed():
		if playerControll == true:
			if mousePressed == true:
				if get_global_mouse_position().y < (position.y - 100):
					if position.y > -175*2:
						position.y -= 175
				if get_global_mouse_position().y > (position.y + 100):
					if position.y < 175*2:
						position.y += 175
