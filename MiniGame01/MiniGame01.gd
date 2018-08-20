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
	
	if localisation == 0:
		grounds.loadGermany()


#------Own Methods------#
func _hudControll():
	#hud run with player position
	hud.rect_position.x = player.position.x - 750
	#limt right left for hud
	if hud.rect_position.x < -750:
		hud.rect_position.x = -750
	elif hud.rect_position.x > 1920*3 - 750:
		hud.rect_position.x = 1920*3 - 750
