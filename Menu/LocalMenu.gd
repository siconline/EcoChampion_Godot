extends Node

onready var camera = $'CameraMenu'
onready var controller = get_node("../../Controller")

func _ready():
	camera.current = true

func _on_Button_Back_pressed():
	camera.current = false
	# index for node Level Menu
	controller.index = 1
	# variable for remove child nodes from Controller
	controller.clean = true

func _on_Button_Germany_pressed():
	camera.current = false
	# index for node MiniGame01
	controller.index = 3
	# variable for remove child nodes from Controller
	controller.clean = true
	# Index for Localisation Country Background
	controller.local = 0


func _on_Button_Marocco_pressed():
	camera.current = false
	# index for node MiniGame01
	controller.index = 3
	# variable for remove child nodes from Controller
	controller.clean = true
	# Index for Localisation Country Background
	controller.local = 1


func _on_Button_Argentina_pressed():
	camera.current = false
	# index for node MiniGame01
	controller.index = 3
	# variable for remove child nodes from Controller
	controller.clean = true
	# Index for Localisation Country Background
	controller.local = 2
