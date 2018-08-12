extends Node

onready var camera = $'CameraMenu'
onready var controller = get_node("../../Controller")

func _ready():
	camera.current = true

func _on_Button_Back_pressed():
	camera.current = false
	controller.index = 0
	controller.clean = true


func _on_Button_MiniGame01_pressed():
	camera.current = false
	controller.index = 2
	controller.clean = true
