extends Node

onready var menu = $Menu
onready var miniGame01 = $MiniGame01

func _ready():
	miniGame01.camera.current = false
	menu.camera.current = true

func _process(delta):
	# load the Theme by index and which button is pressed on menu
	_loadTheme(menu.button_Germany.pressed, 0)

func _loadTheme(button, index):
	if button:
		menu.visible = false
		menu.camera.current = false
		miniGame01.visible = true
		miniGame01.localisation = index
		miniGame01.camera.current = true
		
