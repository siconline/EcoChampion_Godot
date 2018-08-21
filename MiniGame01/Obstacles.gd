extends Node2D

onready var player = get_node("../Player")
onready var obstacles = [$Obstacle1, $Obstacle2, $Obstacle3]
onready var obstaclesCollision = [$Obstacle1/CollisionShape2D, $Obstacle2/CollisionShape2D, $Obstacle3/CollisionShape2D]
onready var obstaclesSprite = [$Obstacle1/Sprite, $Obstacle2/Sprite, $Obstacle3/Sprite]
onready var miniGame01 = get_node("../../MiniGame01")
#Position Obstacles are possible
var positions = [350, 175, 0, -175, -350]
#Variables for Methods _randomObstaclesPos() and _randomObstaclesValues()
var randomPos
var randomItem
#Texturen for Obstacles
# 0 = Baum
# 1 = Fels1
# 2 = Fels2
# 3 = Schlagloch
# 4 = Wasserloch1
# 5 = Wasserloch2
var textures = [preload('res://MiniGame01/Textures/Obstacles/T_Baum.png'), preload('res://MiniGame01/Textures/Obstacles/T_fels1_a.png'), preload('res://MiniGame01/Textures/Obstacles/T_fels2_a.png'), preload('res://MiniGame01/Textures/Obstacles/T_Schlagloch.png'), preload('res://MiniGame01/Textures/Obstacles/T_Wasserloch.png'), preload('res://MiniGame01/Textures/Obstacles/T_wasserloch_2.png')]
#Obstacles Parameters
var objIndex
# 0 = Baum
# 1 = Felsen
# 2 = Loch / Wasserloch
var posSprite = [Vector2(0, 0), Vector2(0, 0), Vector2(0, 50)]
var scaleSprite = [Vector2(0.55, 0.55), Vector2(1, 1), Vector2(1, 1)]
var colliExtents = [Vector2(22, 81), Vector2(111, 47), Vector2(74, 45)]
var colliPos = [Vector2(-8.5, 25), Vector2(1.5, 56), Vector2(-2.7, 9)]
#Boolean to set Value by localisation MiniGame01
var setValue = false

func _ready():
	randomize()
	_randomObstaclesPos()
	
	

func _process(delta):
	_controll_ZIndex()
	
	if setValue == true:
		_randomObstaclesValues()



#----Own Methods----#
func _controll_ZIndex():
	#player is behind or in front of the object
	for i in range(0, obstacles.size()):
		if player.position.y >= obstacles[i].position.y:
			obstaclesSprite[i].z_index = -1
		else:
			obstaclesSprite[i].z_index = 0

func _randomObstaclesPos():
	for obj in obstacles:
		randomPos  = randi()%4
		obj.position.y = positions[randomPos]
		
func _randomObstaclesValues():
	for i in range(0, obstacles.size()):
		randomItem = randi()%5
		if randomItem == 0:
			if miniGame01.localisation == 2:
				randomItem = 1
			else:
				obstaclesSprite[i].position = posSprite[0]
				obstaclesSprite[i].scale = scaleSprite[0]
				obstaclesCollision[i].get_shape().set_extents(colliExtents[0])
				obstaclesCollision[i].position = colliPos[0]
		elif randomItem == 1 || randomItem == 2:
			if miniGame01.localisation == 2:
				obstaclesSprite[i].position = posSprite[1]
				obstaclesSprite[i].scale = scaleSprite[1]
				obstaclesCollision[i].get_shape().set_extents(colliExtents[1])
				obstaclesCollision[i].position = colliPos[1]
			else:
				obstaclesSprite[i].position = posSprite[0]
				obstaclesSprite[i].scale = scaleSprite[0]
				obstaclesCollision[i].get_shape().set_extents(colliExtents[0])
				obstaclesCollision[i].position = colliPos[0]
				randomItem = 0
		elif randomItem == 3 || randomItem == 4 || randomItem == 5:
			obstaclesSprite[i].position = posSprite[2]
			obstaclesSprite[i].scale = scaleSprite[2]
			obstaclesCollision[i].get_shape().set_extents(colliExtents[2])
			obstaclesCollision[i].position = colliPos[2]
		obstaclesSprite[i].texture = textures[randomItem]
	setValue = false