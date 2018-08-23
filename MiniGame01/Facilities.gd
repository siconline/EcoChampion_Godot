extends Node2D

onready var miniGame01 = get_node("../../MiniGame01")
onready var plasticBehind = $Plastic/Behind
onready var paperBehind = $Paper/Behind
onready var metalBehind = $Metal/Behind
onready var pickUp = get_node("../PickUps")
onready var dropPlayerPlastic = $Plastic/DropPlayer
onready var dropPlayerPaper = $Paper/DropPlayer
onready var dropPlayerMetal = $Metal/DropPlayer
onready var plasticWasteSprite = $Plastic/WasteAnim
onready var paperWasteSprite = $Paper/WasteAnim
onready var metalWasteSprite = $Metal/WasteAnim
# 0 = Paper A,M
# 1 = Paper G
# 2 = Metal A,M
# 3 = Metal G
# 4 = Plastic A,M
# 5 = Plastic G
var textures = [preload('res://MiniGame01/Textures/Facilities/t1_hinten_am.png'), preload('res://MiniGame01/Textures/Facilities/t1_hinten_d.png'), preload('res://MiniGame01/Textures/Facilities/t2_hinten_am.png'), preload('res://MiniGame01/Textures/Facilities/t2_hinten_d.png'), preload('res://MiniGame01/Textures/Facilities/t3_hinten_am.png'), preload('res://MiniGame01/Textures/Facilities/t3_hinten_d.png')]

func _ready():
	pass

func _process(delta):
	#----controll the animation player----#
	if dropPlayerPlastic.is_playing():
		plasticWasteSprite.visible = true
	else:
		plasticWasteSprite.visible = false
		if pickUp.pickUpTypBarrow.size() > 0:
			plasticWasteSprite.texture = pickUp.textures[pickUp.pickUpTypBarrow[pickUp.pickUpTypBarrow.size()-1]]
	if dropPlayerPaper.is_playing():
		paperWasteSprite.visible = true
	else:
		paperWasteSprite.visible = false
		if pickUp.pickUpTypBarrow.size() > 0:
			paperWasteSprite.texture = pickUp.textures[pickUp.pickUpTypBarrow[pickUp.pickUpTypBarrow.size()-1]]
	if dropPlayerMetal.is_playing():
		metalWasteSprite.visible = true
	else:
		metalWasteSprite.visible = false
		if pickUp.pickUpTypBarrow.size() > 0:
			metalWasteSprite.texture = pickUp.textures[pickUp.pickUpTypBarrow[pickUp.pickUpTypBarrow.size()-1]]
	
	#----Load the right texture by localisation id -- minigame01----#
	if miniGame01.localisation == 0:
		plasticBehind.texture = textures[5]
		paperBehind.texture = textures[1]
		metalBehind.texture = textures[3]
	else:
		plasticBehind.texture = textures[4]
		paperBehind.texture = textures[0]
		metalBehind.texture = textures[2]
