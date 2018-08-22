extends Control

onready var pausemenu = $Pausemenu
onready var button_Pause = $Button_Pause
onready var miniGame01 = get_node("../../../../MiniGame01")
onready var score = $Score_Count
onready var clock = $Clock/Clock_Timer

var scoreCount = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
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