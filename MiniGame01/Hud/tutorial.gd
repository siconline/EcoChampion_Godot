extends Node

onready var player = get_node("../../../../Player")
onready var clock = get_node("../../../../Player/Node2D/Hud/Clock/Clock_Timer")
onready var tutorial = get_node("../tutorial")



var index = 0

func _ready():
	pass

func _process(delta):
	
	_changeBackground(index)
#######################
#CHANGE THE BACKGROUND#
#######################
func _changeBackground(index):
	############################################
	#AT BEGIN SET ALL BACKGROUNDS VISIBLE FALSE#
	############################################
	for i in range(1, 6):
		var obj = str('backgrounds/background', i)
		get_node(obj).visible = false
	##########################################
	#SET THE BACKGROUND VISIBLE TRUE BY INDEX#
	##########################################
	var obj = str('backgrounds/background', index+1)
	get_node(obj).visible = true
##############################
#CONTROLL INDEX ID BY BUTTONS#
##############################
func _on_button_forward_pressed():
	if index < 4:
		index += 1
func _on_button_backward_pressed():
	if index > 0:
		index -= 1

func _on_button_continue_pressed():
	get_tree().set_pause(false)
	player.speed = player.maxSpeed
	player.animPlayer.stop(true)
	clock.start()
	tutorial.visible = false
	player.playerControll = true
