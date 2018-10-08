extends Node
#M001#CONTROLL THE CONTROLL INPUT KEYBOARD AND MOUSE FOR LEFT AND RIGHT#
#M002#CONTROLL THE SPEED BY OVERLAP OBSTACLES#
#M003#CONTROLL THE PICKUPS AT BARROW BY OVERLAP OBSTACLE AND FACILITY#
#M004#CONTROLL THE ANIMATION AND SPEED BY PARTNER AND FACILITY#
#M005#CONTROLL ANIMATION LOST PICKUP COLLISION OBSTACLES#
#START####START#
#MAIN VARIABLES#
#START####START#
onready var _player = get_node("../MiniGame01/Player")
#END########END#
#MAIN VARIABLES#
#END########END#
#M001_____________________________________________________________________________M001
#START#######################################################START#
#CONTROLL THE CONTROLL INPUT KEYBOARD AND MOUSE FOR LEFT AND RIGHT#
#START#######################################################START#
func pressedMouseForDirection(left, right):
	var player = _player
	var lOr
	var offset
	var speed
	var posPickUp
	var posPowerUps
	if left:
		lOr = true
		offset = -10
		posPickUp = -20
		posPowerUps = -100
		player.speed = -player.maxSpeed
	else:
		lOr = false
		offset = 10
		posPickUp = 20
		posPowerUps = 100
		player.speed = player.maxSpeed
	#Set player position out of collision facility
	if player.facilityCollControll == false:
		player.position.x = player.position.x + offset
	#Stop the current animPlayer animation
	player.get_node("AnimationPlayer").stop(true)
	player.get_node("Sprite").flip_h = lOr
	player.get_node("Barrow_Front_Normal").flip_h = lOr
	player.get_node("Barrow_Front_Upgrade").flip_h = lOr
	player.posPickUps = posPickUp
	
	player.get_node("PowerUps/PowerUp1").flip_h = lOr
	player.get_node("PowerUps/PowerUp2").flip_h = lOr
	player.get_node("PowerUps").position.x = posPowerUps
	#give pickUps 1-6 position.x
	for i in range(1, 7):
		var obj = str("PickUps/PickUp" , i)
		player.get_node(obj).flip_h = lOr
		player.get_node(obj).position.x = player.posPickUps
		player.posPickUps = player.posPickUps + offset
	#---reset CONTROLL POINT----#
	player.facilityCollControll = true
#END###########################################################END#
#CONTROLL THE CONTROLL INPUT KEYBOARD AND MOUSE FOR LEFT AND RIGHT#
#END###########################################################END#
#M002_____________________________________________________________________________M002
#START#############################START#
#CONTROLL THE SPEED BY OVERLAP OBSTACLES#
#START#############################START#
func collideObstacleSpeedSlowly():
	#SOUNDPLAY
	var streamPlayer = AudioStreamPlayer.new()
	self.add_child(streamPlayer)
	streamPlayer.stream = load("res://Sounds/S_mud.wav")
	streamPlayer.play()
	
	_player.playerControll = false
	var player = _player
	if player.speed > 0:
		player.speed = player.slowSpeed
	else:
		player.speed = -player.slowSpeed
func collideObstacleSpeedNormal():
	_player.playerControll = true
	var player = _player
	if player.speed > 0:
		player.speed = player.maxSpeed
	if player.speed < 0:
		player.speed = -player.maxSpeed
#END#################################END#
#CONTROLL THE SPEED BY OVERLAP OBSTACLES#
#END#################################END#
#M003_____________________________________________________________________________M003
#START#####################################################START#
#CONTROLL THE PICKUPS AT BARROW BY OVERLAP OBSTACLE AND FACILITY#
#START#####################################################START#
func collideObstacleDamage(pickUpIndex, pickUpName):
	var player  		= _player
	var plastic 		= get_node("../MiniGame01/Facilities/Plastic/DropPlayer")
	var paper   		= get_node("../MiniGame01/Facilities/Paper/DropPlayer")
	var metal  	    	= get_node("../MiniGame01/Facilities/Metal/DropPlayer")
	var coin_anim_plastic = get_node("../MiniGame01/Facilities/Plastic/scoreCoins_Plastic")
	var coin_anim_paper = get_node("../MiniGame01/Facilities/Paper/scoreCoins_Paper")
	var coin_anim_metal  = get_node("../MiniGame01/Facilities/Metal/scoreCoins_Metal")
	var pickUps 		= get_node("../MiniGame01/PickUps")
	var hud     		= get_node("../MiniGame01/Player/Node2D/Hud")
	var timer_ItemLost  = $timer_ItemLost
	var animPlayer 		= get_node("../MiniGame01/Player/AnimationPlayer")
	var animPlayer_collide_obstacle = get_node("../MiniGame01/Player/anim_ItemLose")
	#var spriteItemLose 	= get_node("../MiniGame01/Player/ItemLose")
	if pickUps.counterPickUps > 0:
		var obj = str("../MiniGame01/Player/PickUps/PickUp", pickUps.counterPickUps)
		get_node(obj).visible = false
		#FOR TIMEOUT COUNTER
		get_node("../MiniGame01/PickUps").pickUpCounter += 1
		#----check the item on weelbarrow----#
		if pickUps.pickUpTypBarrow[pickUps.pickUpTypBarrow.size()-1] == pickUpIndex:
			#print(pickUpName)
			if pickUpName == "Plastic":
				playSoundScore()
				plastic.play("Waste_IN")
				hud.scoreCount += 100
				coin_anim_plastic.emitting = true
				
			elif pickUpName == "Metal":
				playSoundScore()
				metal.play("Waste_IN")
				hud.scoreCount += 50
				coin_anim_metal.emitting = true
				
			else:
				paper.play("Waste_IN")
				playSoundScore()
				hud.scoreCount += 25
				coin_anim_paper.emitting = true
		else:
			if pickUpIndex == 9 && pickUpName == "Value":
				pass
			else:
				if player.position.y == -350:
					plastic.play("Waste_OUT")
				elif player.position.y == 0:
					paper.play("Waste_OUT")
				elif player.position.y == 350:
					metal.play("Waste_OUT")
				#print('Wrong Item')
		pickUps.counterPickUps -= 1
		pickUps.pickUpTypBarrow.remove(pickUps.pickUpTypBarrow.size()-1)
	if pickUpIndex == 9 && pickUpName == "Value":
		#SOUND
		playSoundObstacle()
		animPlayer.play("Idle")
		player.playerControll = false
		if player.speed > 0:
			player.position.x = player.position.x - 50
			#start Animation
			animPlayer_collide_obstacle.play("blink_R")
		if player.speed < 0:
			player.position.x = player.position.x + 50
			#start Animation
			animPlayer_collide_obstacle.play("blink_L")
		player.speed = 0
		player.playerControll = false
		timer_ItemLost.start()
	
func _on_timer_ItemLost_timeout():
	var player  = _player
	player.playerControll = true
#END#########################################################END#
#CONTROLL THE PICKUPS AT BARROW BY OVERLAP OBSTACLE AND FACILITY#
#END#########################################################END#
#M004_____________________________________________________________________________M004
#START##############################################START#
#CONTROLL THE ANIMATION AND SPEED BY PARTNER AND FACILITY#
#START##############################################START#
func stopRunAndSetSpeed():
	var player = _player
	if player.facilityCollControll == true:
			if player.speed > 0:
				player.speed = 100
			else:
				player.speed = -100
			player.animPlayer.stop(true)
			player.facilityCollControll = false
#END##################################################END#
#CONTROLL THE ANIMATION AND SPEED BY PARTNER AND FACILITY#
#END##################################################END#
#M005_____________________________________________________________________________M005
#START########################################START#
#CONTROLL ANIMATION LOST PICKUP COLLISION OBSTACLES#
#START########################################START#
func lostItemColliObstacle(index):
	var player = _player
	var pickUps = get_node("../MiniGame01/PickUps")
	var obstacles = get_node("../MiniGame01/Obstacles")
	#var lostItem_animPlayer = get_node("../MiniGame01/Obstacles/Obstacle1/LostItem/AnimationPlayer")
	#var lostItem_Sprite = get_node("../MiniGame01/Obstacles/Obstacle1/LostItem")
	if pickUps.counterPickUps > 0:
		if pickUps.pickUpTypBarrow.size() > 0:
			obstacles.arr_lostItem_Sprites[index].texture = pickUps.textures[pickUps.pickUpTypBarrow[pickUps.pickUpTypBarrow.size()-1]]
		if player.speed > 0:
			obstacles.arr_lostItem_animPlayers[index].play("lostItem_R")
		if player.speed < 0:
			obstacles.arr_lostItem_animPlayers[index].play("lostItem_L")
#END############################################END#
#CONTROLL ANIMATION LOST PICKUP COLLISION OBSTACLES#
#END############################################END#

#SOUNDS----------------------#
func playSoundScore():
	var timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	self.add_child(timer)
	timer.one_shot = true
	timer.wait_time = 1
	timer.start()
func _on_timer_timeout():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_bing_fast.wav")
	player.play()
#SOUNDS--------------------------#
func playSoundObstacle():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_obstacle.wav")
	player.play()
