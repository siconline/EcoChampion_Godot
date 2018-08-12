extends Node

onready var camera = $'CameraMenu'
onready var controller = get_node("../../Controller")

func _ready():
	camera.current = true

func _on_Button_Back_pressed():
	camera.current = false
	# index for node Main Menu
	controller.index = 0
	# variable for remove child nodes from Controller
	controller.clean = true


func _on_Button_MiniGame01_pressed():
	camera.current = false
	# index for node Local Menu
	controller.index = 2
	# variable for remove child nodes from Controller
	controller.clean = true
