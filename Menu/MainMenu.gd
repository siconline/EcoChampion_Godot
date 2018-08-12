extends Node

onready var camera = $'CameraMenu'
onready var controller = get_node("../../Controller")

func _ready():
	camera.current = true


func _on_Button_LevelMenu_pressed():
	camera.current = false
	# index for node Level Menu
	controller.index = 1
	# variable for remove child nodes from Controller
	controller.clean = true

func _on_Button_Score_pressed():
	pass # replace with function body

func _on_Button_Quit_pressed():
	# Exit Game / Close Application
	get_tree().quit()