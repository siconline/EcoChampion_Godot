extends Node

onready var menu = $Menu
onready var miniGame01 = $MiniGame01

func _ready():
	pass

func _process(delta):
	# load the Theme by index and which button is pressed on menu
	_loadTheme(menu.button_Germany.pressed, 0)

func _loadTheme(button, index):
	if button:
		menu.visible = false
		miniGame01.visible = true
		miniGame01.localisation = index
