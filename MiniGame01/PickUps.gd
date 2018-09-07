extends Node2D

onready var pickUps = [$PickUp1, $PickUp2, $PickUp3, $PickUp4, $PickUp5, $PickUp6, $PickUp7, $PickUp8, $PickUp9, $PickUp10, $PickUp11, $PickUp12, $PickUp13, $PickUp14, $PickUp15, $PickUp16, $PickUp17, $PickUp18, $PickUp19, $PickUp20, $PickUp21, $PickUp22, $PickUp23, $PickUp24, $PickUp25, $PickUp26]
onready var pickUpsCollision = [$PickUp1/CollisionShape2D, $PickUp2/CollisionShape2D, $PickUp3/CollisionShape2D, $PickUp4/CollisionShape2D, $PickUp5/CollisionShape2D, $PickUp6/CollisionShape2D, $PickUp7/CollisionShape2D, $PickUp8/CollisionShape2D, $PickUp9/CollisionShape2D, $PickUp10/CollisionShape2D, $PickUp11/CollisionShape2D, $PickUp12/CollisionShape2D, $PickUp13/CollisionShape2D, $PickUp14/CollisionShape2D, $PickUp15/CollisionShape2D, $PickUp16/CollisionShape2D, $PickUp17/CollisionShape2D, $PickUp18/CollisionShape2D, $PickUp19/CollisionShape2D, $PickUp20/CollisionShape2D, $PickUp21/CollisionShape2D, $PickUp22/CollisionShape2D, $PickUp23/CollisionShape2D, $PickUp24/CollisionShape2D, $PickUp25/CollisionShape2D, $PickUp26/CollisionShape2D]
onready var pickUpsSprite = [$PickUp1/Sprite, $PickUp2/Sprite, $PickUp3/Sprite, $PickUp4/Sprite, $PickUp5/Sprite, $PickUp6/Sprite, $PickUp7/Sprite, $PickUp8/Sprite, $PickUp9/Sprite, $PickUp10/Sprite, $PickUp11/Sprite, $PickUp12/Sprite, $PickUp13/Sprite, $PickUp14/Sprite, $PickUp15/Sprite, $PickUp16/Sprite, $PickUp17/Sprite, $PickUp18/Sprite, $PickUp19/Sprite, $PickUp20/Sprite, $PickUp21/Sprite, $PickUp22/Sprite, $PickUp23/Sprite, $PickUp24/Sprite, $PickUp25/Sprite, $PickUp26/Sprite]
onready var player = get_node("../Player")
onready var animPlayerPickup = get_node("../Player/PickUps/animPlayer_pickup")
onready var animSpritePickup = get_node("../Player/PickUps/animSprite_pickup")
#Position Pickups are possible
var positions = [350, 175, 0, -175, -350]
#Texture Pickups are possible
var textures = [preload('res://MiniGame01/Textures/PickUps/T_Plastic_Bottle.png'), preload('res://MiniGame01/Textures/PickUps/T_Paper_Newspaper.png'), preload('res://MiniGame01/Textures/PickUps/T_Metal_Can.png')]
#Variables for Methods _randomPickUpPos() and _randomPickUpTexture()
var randomPos
var randomItem
#Variables for Methods Area Overlapping
var counterPickUps = 0
var maxItems = 6
#PickUp Typ 0 = Plastic 1 = Paper 2 = Metal
var pickUpTyp = []
var pickUpTypBarrow = []

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
func _on_PickUp5_body_entered(body):
	_controllItemsBarrow(4)
func _on_PickUp6_body_entered(body):
	_controllItemsBarrow(5)
func _on_PickUp7_body_entered(body):
	_controllItemsBarrow(6)
func _on_PickUp8_body_entered(body):
	_controllItemsBarrow(7)
func _on_PickUp9_body_entered(body):
	_controllItemsBarrow(8)
func _on_PickUp10_body_entered(body):
	_controllItemsBarrow(9)
func _on_PickUp11_body_entered(body):
	_controllItemsBarrow(10)
func _on_PickUp12_body_entered(body):
	_controllItemsBarrow(11)
func _on_PickUp13_body_entered(body):
	_controllItemsBarrow(12)
func _on_PickUp14_body_entered(body):
	_controllItemsBarrow(13)
func _on_PickUp15_body_entered(body):
	_controllItemsBarrow(14)
func _on_PickUp16_body_entered(body):
	_controllItemsBarrow(15)
func _on_PickUp17_body_entered(body):
	_controllItemsBarrow(16)
func _on_PickUp18_body_entered(body):
	_controllItemsBarrow(17)
func _on_PickUp19_body_entered(body):
	_controllItemsBarrow(18)
func _on_PickUp20_body_entered(body):
	_controllItemsBarrow(19)
func _on_PickUp21_body_entered(body):
	_controllItemsBarrow(20)
func _on_PickUp22_body_entered(body):
	_controllItemsBarrow(21)
func _on_PickUp23_body_entered(body):
	_controllItemsBarrow(22)
func _on_PickUp24_body_entered(body):
	_controllItemsBarrow(23)
func _on_PickUp25_body_entered(body):
	_controllItemsBarrow(24)
func _on_PickUp26_body_entered(body):
	_controllItemsBarrow(25)


#----Own Methods----#
func _randomPickUpPos():
	for obj in pickUps:
		randomPos  = randi()%5
		obj.position.y = positions[randomPos]

func _randomPickUpTexture():
	for obj in pickUpsSprite:
		randomItem = randi()%3
		obj.texture = textures[randomItem]
		pickUpTyp.append(randomItem)

func _controllItemsBarrow(index):
	if counterPickUps < maxItems:
		for i in range(0, pickUps.size()):
			var obj = str("pickUp" , i+1)
			if counterPickUps == i:
				player.get(obj).visible = true
				player.get(obj).texture = pickUpsSprite[index].texture
				pickUps[index].visible = false
				pickUpsCollision[index].disabled = true
				pickUpTypBarrow.append(pickUpTyp[index])
		
		animSpritePickup.texture = pickUpsSprite[index].texture
		if player.speed > 0:
			animPlayerPickup.play("pickUpRightIN")
		else:
			animPlayerPickup.play("pickUpLeftIN")
		counterPickUps += 1


