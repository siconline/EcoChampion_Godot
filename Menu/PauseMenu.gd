extends Node

onready var camera = $'CameraMenu'
onready var controller = get_node("../../Controller")

func _ready():
	camera.current = true

func _process(delta):
	pass


func _on_Button_MainMenu_pressed():
	camera.current = false
	# index for node Main Menu
	controller.index = 0
	# variable for remove child nodes from Controller
	controller.clean = true

func _on_Button_QuitGame_pressed():
	# Exit Game / Close Application
	get_tree().quit()