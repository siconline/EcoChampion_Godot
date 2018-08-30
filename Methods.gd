extends Node
#M001
#10-49#CONTROLL THE CONTROLL INPUT KEYBOARD AND MOUSE FOR LEFT AND RIGHT#
#M002
#50-66#CONTROLL THE SPEED BY OVERLAP OBSTACLES#


func _ready():
	pass
#M001_____________________________________________________________________________M001
#START#######################################################START#
#CONTROLL THE CONTROLL INPUT KEYBOARD AND MOUSE FOR LEFT AND RIGHT#
#START#######################################################START#
onready var player = get_node("../MiniGame01/Player")
func pressedMouseForDirection(left, right):
	var lOr
	var offset
	var speed
	var posPickUp
	if left:
		lOr = true
		offset = -10
		posPickUp = -20
		player.speed = -player.maxSpeed
	else:
		lOr = false
		offset = 10
		posPickUp = 20
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
	if player.speed > 0:
		player.speed = player.slowSpeed
	else:
		player.speed = -player.slowSpeed
func collideObstacleSpeedNormal():
	if player.speed > 0:
		player.speed = player.maxSpeed
	else:
		player.speed = -player.maxSpeed
#END#################################END#
#CONTROLL THE SPEED BY OVERLAP OBSTACLES#
#END#################################END#