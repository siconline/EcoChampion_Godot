extends Node2D

var localisation = 0
onready var grounds = $Grounds
onready var player = $Player
onready var camera = $Player/Camera2D
onready var hud = $Hud

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

# check localisation index of countries an load Theme
func _process(delta):
	_hudControll()
	
	# load the current theme by index
	if localisation == 0:
		grounds.loadGermany()
	elif localisation == 1:
		grounds.loadMorocco()
	elif localisation == 2:
		grounds.loadArgentina()


#------Own Methods------#
func _hudControll():
	#hud run with player position
	hud.rect_position.x = player.position.x
	#limt right left for hud
	if hud.rect_position.x < 0:
		hud.rect_position.x = 0
	elif hud.rect_position.x > 1920*3:
		hud.rect_position.x = 1920*3