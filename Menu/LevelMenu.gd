extends Node

var index = 1
onready var camera = $'CameraMenu'

func _ready():
	camera.current = true

func _on_Button_Back_pressed():
	index = 0
	camera.current = false
