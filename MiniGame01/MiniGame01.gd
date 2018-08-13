extends Node

onready var bgStart = $'Background'
onready var bgMiddle1 = $'Background2'
onready var bgMiddle2 = $'Background3'
onready var bgEnd = $'Background4'
# local COUNTRIES
var local = 0
onready var player = $'Player'
onready var camera = $'Player/Camera_Player'
onready var hud = $'HudMiniGame01'

func _ready():
	#Set Camera Current
	camera.current = true
	#Set Background Sprites
	bgStart.index = 0
	bgMiddle1.index = 1
	bgMiddle2.index = 2
	bgEnd.index = 3
	#Set localisation by Button Local Menu
	bgStart.local = local
	bgMiddle1.local = local
	bgMiddle2.local = local
	bgEnd.local = local

func _process(delta):
		#Hud follow the player
	if player.position.x > 0 && player.position.x < 1920*3:
		hud.rect_position.x = player.position.x
