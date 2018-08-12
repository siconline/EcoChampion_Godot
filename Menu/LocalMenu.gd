extends Node

var index = 2
onready var camera = $'CameraMenu'

func _ready():
	camera.current = true

func _on_Button_Back_pressed():
	index = 1
	camera.current = false