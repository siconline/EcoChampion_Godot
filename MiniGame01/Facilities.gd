extends Node2D

onready var miniGame01 = get_node("../../MiniGame01")
onready var plasticBehind = $Plastic/Behind
onready var paperBehind = $Paper/Behind
onready var metalBehind = $Metal/Behind
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
	
	#----Load the right texture by localisation id -- minigame01----#
	if miniGame01.localisation == 0:
		plasticBehind.texture = textures[5]
		paperBehind.texture = textures[1]
		metalBehind.texture = textures[3]
	else:
		plasticBehind.texture = textures[4]
		paperBehind.texture = textures[0]
		metalBehind.texture = textures[2]
