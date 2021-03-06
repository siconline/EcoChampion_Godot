extends Control

onready var pausemenu = $Pausemenu
onready var button_Pause = $Button_Pause
onready var miniGame01 = get_node("../../../../MiniGame01")
onready var score = $Score_Count
onready var clock_timer = $Clock/Clock_Timer
onready var clock = $Clock
onready var boost = $boost
onready var player = get_node("../../../Player")



var texturesBoost = [preload('res://MiniGame01/Hud/Textures/Boost/boost_button_disabled.png'), preload('res://MiniGame01/Hud/Textures/Boost/boost_button_0.png'), preload('res://MiniGame01/Hud/Textures/Boost/boost_button_1.png'), preload('res://MiniGame01/Hud/Textures/Boost/boost_button_2.png'), preload('res://MiniGame01/Hud/Textures/Boost/boost_button_3.png')]
var boostCounter = 0
var scoreCount = 0

#BONUS TIME
var bonus_min = 0
var bonus_sec = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	
	#BONUS FOR SCORE BY TIME
	if clock.timeout == true:
		bonus_min = 100 * clock.minute
		if clock.minute > 0:
			bonus_sec = 5 * clock.minute
		scoreCount = scoreCount + bonus_min + bonus_sec
	
	
	boost.texture = texturesBoost[boostCounter]
	score.text = str(scoreCount)


func _on_Button_Pause_pressed():
	pausemenu.visible = true
	get_tree().set_pause(true)
	clock_timer.set_paused(true)
	playSoundPressButton()

func _on_Button_Continue_pressed():
	pausemenu.visible = false
	get_tree().set_pause(false)
	clock_timer.set_paused(false)
	playSoundPressButton()


func _on_Button_MainMenu_pressed():
	playSoundPressButton()
	get_tree().reload_current_scene()
	

func _on_Button_Quit_pressed():
	playSoundPressButton()
	# Exit Game / Close Application
	get_tree().quit()
	


func _on_Button_pressed():
	if boostCounter > 1 && get_node("../../../Player").boost == true:
		playSoundSpeedUp()
	get_node("../../../Player").boost_Button_activate()
	

#---SOUNDS----------------------------------#
func _on_Button_Continue_mouse_entered():
	playSoundHoverButton()
func _on_Button_MainMenu_mouse_entered():
	playSoundHoverButton()
func _on_Button_Quit_mouse_entered():
	playSoundHoverButton()
func playSoundHoverButton():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_hover.wav")
	player.play()
func playSoundPressButton():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_click.wav")
	player.play()
func playSoundSpeedUp():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_Boost.wav")
	player.play()