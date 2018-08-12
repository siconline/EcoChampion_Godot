extends Node

onready var camera = $'CameraMenu'
onready var controller = get_node("../../Controller")

func _ready():
	camera.current = true


func _on_Button_LevelMenu_pressed():
	camera.current = false
	controller.index = 1
	controller.clean = true

func _on_Button_Score_pressed():
	pass # replace with function body

func _on_Button_Quit_pressed():
	get_tree().quit()