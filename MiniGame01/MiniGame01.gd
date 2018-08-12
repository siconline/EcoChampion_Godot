extends Node

onready var bgStart = $'Background'
onready var bgMiddle1 = $'Background2'
onready var bgMiddle2 = $'Background3'
onready var bgEnd = $'Background4'
# local COUNTRIES
var local = 0
onready var camera = $'Player/Camera_Player'

func _ready():
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
	#Set Camera Current
	camera.current = true

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
