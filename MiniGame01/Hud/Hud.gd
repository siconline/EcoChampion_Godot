extends Control

onready var pausemenu = $Pausemenu
onready var button_Pause = $Button_Pause
onready var miniGame01 = get_node("../../../../MiniGame01")
onready var score = $Score_Count
onready var clock = $Clock/Clock_Timer
onready var boost = $boost
onready var player = get_node("../../../Player")



var texturesBoost = [preload('res://MiniGame01/Hud/Textures/Boost/boost_button_disabled.png'), preload('res://MiniGame01/Hud/Textures/Boost/boost_button_0.png'), preload('res://MiniGame01/Hud/Textures/Boost/boost_button_1.png'), preload('res://MiniGame01/Hud/Textures/Boost/boost_button_2.png'), preload('res://MiniGame01/Hud/Textures/Boost/boost_button_3.png')]
var boostCounter = 0
var scoreCount = 0



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	boost.texture = texturesBoost[boostCounter]
	score.text = str(scoreCount)


func _on_Button_Pause_pressed():
	pausemenu.visible = true
	get_tree().set_pause(true)
	clock.set_paused(true)

func _on_Button_Continue_pressed():
	pausemenu.visible = false
	get_tree().set_pause(false)
	clock.set_paused(false)


func _on_Button_MainMenu_pressed():
	get_tree().reload_current_scene()


func _on_Button_Quit_pressed():
	# Exit Game / Close Application
	get_tree().quit()


func _on_Button_pressed():
	get_node("../../../Player").boost_Button_activate()
