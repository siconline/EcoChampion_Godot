extends Node

var index = 0
onready var camera = $'CameraMenu'

func _ready():
	camera.current = true


func _on_Button_LevelMenu_pressed():
	index = 1
	camera.current = false

func _on_Button_Score_pressed():
	pass # replace with function body

func _on_Button_Quit_pressed():
	get_tree().quit()