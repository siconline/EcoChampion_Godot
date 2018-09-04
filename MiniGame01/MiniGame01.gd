extends Node2D

var localisation = 0
onready var grounds = $Grounds
onready var player = $Player
onready var camera = $Player/Camera2D
onready var hud = $Player/Node2D/Hud

var checkLevelPressedButton = false

func _ready():
	pass

# check localisation index of countries an load Theme
func _process(delta):
	_hudControll()
	
	# load the current theme by index
	if checkLevelPressedButton == true:
		if localisation == 0:
			grounds.loadGermany()
		elif localisation == 1:
			grounds.loadMorocco()
		elif localisation == 2:
			grounds.loadArgentina()
		get_tree().set_pause(true)
		checkLevelPressedButton = false


#------Own Methods------#
func _hudControll():
	#limt right left for hud
	if player.position.x < 0:
		hud.rect_position.x += player.speed * 0.001 - (player.position.x + hud.rect_position.x)
	elif player.position.x > 0 && player.position.x < 1920*3:
		hud.rect_position.x = 0
	elif player.position.x > 1920*3:
		hud.rect_position.x -= player.speed * 0.001 + (hud.rect_position.x + (player.position.x) - 1920*3)
	#set hud y position by player step
	if player.position.y == -175 * 2:
		hud.rect_position.y = 175 * 2
	elif player.position.y == -175:
		hud.rect_position.y = 175
	elif player.position.y == 0:
		hud.rect_position.y = 0
	elif player.position.y == 175:
		hud.rect_position.y = -175
	elif player.position.y == 175 * 2:
		hud.rect_position.y = -175 * 2
	
	#player position correction
	if player.position.y > -175 * 2 && player.position.y < -175 - 87.5:
		player.position.y = -350
	elif player.position.y > -175 && player.position.y < 0 - 87.5:
		player.position.y = -175
		
	elif player.position.y > -87.5 && player.position.y < 0:
		player.position.y = 0
	elif player.position.y < 87.5 && player.position.y > 0:
		player.position.y = 0
		
	elif player.position.y < 175 * 2 && player.position.y > 175 + 87.5:
		player.position.y = 350
	elif player.position.y < 175 && player.position.y > 0 + 87.5:
		player.position.y = 175
