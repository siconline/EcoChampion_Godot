extends Node

onready var menu = $Menu
onready var miniGame01 = $MiniGame01
onready var obstacles = $MiniGame01/Obstacles
onready var player = $MiniGame01/Player

func _ready():
	miniGame01.camera.current = false
	menu.camera.current = true

func _process(delta):
	# load the Theme by index and which buttons are pressed on menu
	_loadTheme(menu.button_Germany.pressed, 0)
	_loadTheme(menu.button_Morocco.pressed, 1)
	_loadTheme(menu.button_Argentina.pressed, 2)

func _loadTheme(button, index):
	if button:
		menu.visible = false
		menu.camera.current = false
		miniGame01.visible = true
		miniGame01.localisation = index
		miniGame01.camera.current = true
		obstacles.setValue = true
		player.speed = 500