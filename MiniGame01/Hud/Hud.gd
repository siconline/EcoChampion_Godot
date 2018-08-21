extends Control

onready var pausemenu = $Pausemenu
onready var button_Pause = $Button_Pause
onready var miniGame01 = get_node("../../../../MiniGame01")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_Pause_pressed():
	pausemenu.visible = true
	get_tree().set_pause(true)

func _on_Button_Continue_pressed():
	pausemenu.visible = false
	get_tree().set_pause(false)


func _on_Button_MainMenu_pressed():
	get_tree().reload_current_scene()


func _on_Button_Quit_pressed():
	# Exit Game / Close Application
	get_tree().quit()