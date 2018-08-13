extends Node

onready var camera = $'CameraHud'
onready var controller = get_node("../../../Controller")

func _ready():
	camera.current = true

func _process(delta):
	pass



func _on_Button_Pause_pressed():
	camera.current = false
	# index for node Main Menu
	controller.index = 4
	# variable for remove child nodes from Controller
	controller.clean = true
