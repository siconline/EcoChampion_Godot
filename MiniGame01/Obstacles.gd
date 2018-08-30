extends Node2D

onready var methods = get_node("../../Methods")

onready var player = get_node("../Player")
onready var obstacles = [$Obstacle1, $Obstacle2, $Obstacle3, $Obstacle4, $Obstacle5, $Obstacle6, $Obstacle7, $Obstacle8, $Obstacle9, $Obstacle10, $Obstacle11, $Obstacle12, $Obstacle13, $Obstacle14]
onready var obstaclesCollision = [$Obstacle1/CollisionShape2D, $Obstacle2/CollisionShape2D, $Obstacle3/CollisionShape2D, $Obstacle4/CollisionShape2D, $Obstacle5/CollisionShape2D, $Obstacle6/CollisionShape2D, $Obstacle7/CollisionShape2D, $Obstacle8/CollisionShape2D, $Obstacle9/CollisionShape2D, $Obstacle10/CollisionShape2D, $Obstacle11/CollisionShape2D, $Obstacle12/CollisionShape2D, $Obstacle13/CollisionShape2D, $Obstacle14/CollisionShape2D]
onready var obstaclesSprite = [$Obstacle1/Sprite, $Obstacle2/Sprite, $Obstacle3/Sprite, $Obstacle4/Sprite, $Obstacle5/Sprite, $Obstacle6/Sprite, $Obstacle7/Sprite, $Obstacle8/Sprite, $Obstacle9/Sprite, $Obstacle10/Sprite, $Obstacle11/Sprite, $Obstacle12/Sprite, $Obstacle13/Sprite, $Obstacle14/Sprite]
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
var posSprite = [Vector2(0, 50), Vector2(0, 0), Vector2(0, 50)]
var scaleSprite = [Vector2(0.55, 0.55), Vector2(1, 1), Vector2(1, 1)]
var colliExtents = [Vector2(22, 81), Vector2(111, 47), Vector2(74, 45)]
var colliPos = [Vector2(-8.5, 25), Vector2(1.5, 56), Vector2(-2.7, 9)]
#Boolean to set Value by localisation MiniGame01
var setValue = false
#Obstacle Typ 0 = lower Speed 1 = Damage
var obstacleTyp = []

func _ready():
	randomize()
	_randomObstaclesPos()
	
	

func _process(delta):
	_controll_ZIndex()
	
	if setValue == true:
		_randomObstaclesValues()


#----AREAS2D--------------ENTERED----------#
func _on_Obstacle1_body_entered(body):
	if obstacleTyp[0] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle2_body_entered(body):
	if obstacleTyp[1] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle3_body_entered(body):
	if obstacleTyp[2] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle4_body_entered(body):
	if obstacleTyp[3] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle5_body_entered(body):
	if obstacleTyp[4] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle6_body_entered(body):
	if obstacleTyp[5] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle7_body_entered(body):
	if obstacleTyp[6] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle8_body_entered(body):
	if obstacleTyp[7] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle9_body_entered(body):
	if obstacleTyp[8] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle10_body_entered(body):
	if obstacleTyp[9] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle11_body_entered(body):
	if obstacleTyp[10] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle12_body_entered(body):
	if obstacleTyp[11] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle13_body_entered(body):
	if obstacleTyp[12] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
func _on_Obstacle14_body_entered(body):
	if obstacleTyp[13] == 0:
		#M002
		methods.collideObstacleSpeedSlowly()
	else:
		player.collideObstacleDamage(9, "Value")
#----AREAS2D--------------EXITED----------#
func _on_Obstacle1_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle2_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle3_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle4_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle5_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle6_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle7_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle8_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle9_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle10_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle11_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle12_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle13_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()
func _on_Obstacle14_body_exited(body):
	#M002
	methods.collideObstacleSpeedNormal()



#----Own Methods----#
func _controll_ZIndex():
	#player is behind or in front of the object
	for i in range(0, obstacles.size()):
		if player.position.y >= obstacles[i].position.y:
			obstacles[i].z_index = -2
		else:
			obstacles[i].z_index = -1

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
		if randomItem == 0 || randomItem == 1 || randomItem == 2:
			obstacleTyp.append(1)
		else:
			obstacleTyp.append(0)
	setValue = false