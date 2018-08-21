extends Node2D

onready var pickUps = [$PickUp1, $PickUp2, $PickUp3, $PickUp4]
onready var pickUpsCollision = [$PickUp1/CollisionShape2D, $PickUp2/CollisionShape2D, $PickUp3/CollisionShape2D, $PickUp4/CollisionShape2D]
onready var pickUpsSprite = [$PickUp1/Sprite, $PickUp2/Sprite, $PickUp3/Sprite, $PickUp4/Sprite]
onready var player = get_node("../Player")
#Position Pickups are possible
var positions = [350, 175, 0, -175, -350]
#Texture Pickups are possible
var textures = [preload('res://MiniGame01/Textures/PickUps/T_Plastic_Bottle.png'), preload('res://MiniGame01/Textures/PickUps/T_Paper_Newspaper.png'), preload('res://MiniGame01/Textures/PickUps/T_Metal_Can.png')]
#Variables for Methods _randomPickUpPos() and _randomPickUpTexture()
var randomPos
var randomItem
#Variables for Methods Area Overlapping
var counterPickUps = 0
var maxItems = 3

func _ready():
	randomize()
	#pickups random Y position
	_randomPickUpPos()
	#pickups random Texture
	_randomPickUpTexture()


func _process(delta):
	pass


#----AREAS2D------------------------#
func _on_PickUp1_body_entered(body):
	_controllItemsBarrow(0)

func _on_PickUp2_body_entered(body):
	_controllItemsBarrow(1)

func _on_PickUp3_body_entered(body):
	_controllItemsBarrow(2)

func _on_PickUp4_body_entered(body):
	_controllItemsBarrow(3)


#----Own Methods----#
func _randomPickUpPos():
	for obj in pickUps:
		randomPos  = randi()%4
		obj.position.y = positions[randomPos]

func _randomPickUpTexture():
	for obj in pickUpsSprite:
		randomItem = randi()%2
		obj.texture = textures[randomItem]

func _controllItemsBarrow(index):
	if counterPickUps < maxItems:
		for i in range(0, pickUps.size()):
			var obj = str("pickUp" , i+1)
			if counterPickUps == i:
				player.get(obj).visible = true
				player.get(obj).texture = pickUpsSprite[index].texture
				pickUps[index].visible = false
				pickUpsCollision[index].disabled = true
		counterPickUps += 1