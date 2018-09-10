extends Node2D

onready var powerup = [$PowerUp1, $PowerUp2, $PowerUp3, $PowerUp4, $PowerUp5, $PowerUp6, $PowerUp7, $PowerUp8, $PowerUp9, $PowerUp10, $PowerUp11, $PowerUp12, $PowerUp13]
var obj = 0
#Position Pickups are possible
var positions = [350, 175, 0, -175, -350]
var randomPos

func _ready():
	for i in range(0, powerup.size()):
		if obj == 0:
			powerup[i].sprite.texture = powerup[i].textures[0]
			obj = 1
		else:
			powerup[i].sprite.texture = powerup[i].textures[1]
			obj = 0
	#RANDOM POSITION Y POWERUPS
	for obj in powerup:
		randomPos  = randi()%5
		obj.position.y = positions[randomPos]

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
