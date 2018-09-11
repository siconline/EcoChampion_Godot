extends Node2D

onready var powerup = [$PowerUp1, $PowerUp2, $PowerUp3, $PowerUp4, $PowerUp5, $PowerUp6, $PowerUp7, $PowerUp8, $PowerUp9, $PowerUp10, $PowerUp11, $PowerUp12, $PowerUp13]
onready var powerupSUP = [$PowerUp1, $PowerUp3, $PowerUp5, $PowerUp7, $PowerUp9, $PowerUp11, $PowerUp13]
onready var powerupTOL = [$PowerUp2, $PowerUp4, $PowerUp6, $PowerUp8, $PowerUp8, $PowerUp10, $PowerUp12]

var obj = 0
#Position Pickups are possible
var positions = [350, 175, 0, -175, -350]
var randomPos

var counterSUP = 0
var counterTOL = 0

func _ready():
	for i in range(0, powerup.size()):
		if obj == 0:
			powerup[i].sprite.texture = powerup[i].textures[0]
			powerup[i].texture_index = 0
			obj = 1
		else:
			powerup[i].sprite.texture = powerup[i].textures[1]
			powerup[i].texture_index = 1
			obj = 0
	#RANDOM POSITION Y POWERUPS
	for obj in powerup:
		randomPos  = randi()%5
		obj.position.y = positions[randomPos]
	
	

func _process(delta):

	powerupSUP[counterSUP].visible = true
	powerupTOL[counterTOL].visible = true
	powerupSUP[counterSUP].collisionShape.disabled = false
	powerupTOL[counterTOL].collisionShape.disabled = false