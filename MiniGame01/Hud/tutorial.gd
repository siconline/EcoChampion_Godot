extends Node

onready var player = get_node("../../../../Player")
onready var clock = get_node("../../../../Player/Node2D/Hud/Clock/Clock_Timer")
onready var tutorial = get_node("../tutorial")
onready var npcAnimThink = get_node("../../../../Npc/thinkbubble/anim_thinkbubble")
onready var timer = $Timer
onready var pause_button = get_node("../../../../Player/Node2D/Hud/Button_Pause")
onready var boost_button = get_node("../../../../Player/Node2D/Hud/boost")


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
	tutorial.visible = false
	npcAnimThink.play("think_animation")
	timer.start()
	pause_button.visible = true
	boost_button.visible = true


func _on_Timer_timeout():
	player.speed = player.maxSpeed
	player.animPlayer.stop(true)
	clock.start()
	player.playerControll = true
