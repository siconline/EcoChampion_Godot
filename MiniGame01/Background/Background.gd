extends Node

var index = 0
#Index
# 0 == Start
# 1 == Middle1
# 2 == Middle2
# 3 == End
var local = 0
#Localisation#
# 0	== Germany
# 1	== Marocco
# 2 == Argentina

onready var background = $'Background'
onready var foregroundTop = $'Foreground_Top'
onready var foregroundBottom = $'Foreground_Bottom'

func _ready():
	pass

func _process(delta):
	if local == 0:
		if index == 0:
			background.texture = preload('res://MiniGame01/Background/Textures/Germany/background/BackgroundStart_d.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Germany/foreground/ForegroundStartTop_d.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Germany/foreground/ForegroundStartBottom_d.png')
		elif index == 1:
			background.texture = preload('res://MiniGame01/Background/Textures/Germany/background/BackgroundMiddle1_d.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Germany/foreground/ForegroundMiddle1Top_d.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Germany/foreground/ForegroundMiddle1Bottom_d.png')
		elif index == 2:
			background.texture = preload('res://MiniGame01/Background/Textures/Germany/background/BackgroundMiddle2_d.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Germany/foreground/ForegroundMiddle2Top_d.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Germany/foreground/ForegroundMiddle2Bottom_d.png')
		elif index == 3:
			background.texture = preload('res://MiniGame01/Background/Textures/Germany/background/BackgroundEnd_d.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Germany/foreground/ForegroundEndTop_d.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Germany/foreground/ForegroundEndBottom_d.png')
	elif local == 1:
		if index == 0:
			background.texture = preload('res://MiniGame01/Background/Textures/Marocco/background/BackgroundStart_m.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Marocco/foreground/ForegroundStartTop_m.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Marocco/foreground/ForegroundStartBottom_m.png')
		elif index == 1:
			background.texture = preload('res://MiniGame01/Background/Textures/Marocco/background/BackgroundMiddle1_m.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Marocco/foreground/ForegroundMiddle1Top_m.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Marocco/foreground/ForegroundMiddle1Bottom_m.png')
		elif index == 2:
			background.texture = preload('res://MiniGame01/Background/Textures/Marocco/background/BackgroundMiddle2_m.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Marocco/foreground/ForegroundMiddle2Top_m.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Marocco/foreground/ForegroundMiddle2Bottom_m.png')
		elif index == 3:
			background.texture = preload('res://MiniGame01/Background/Textures/Marocco/background/BackgroundEnd_m.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Marocco/foreground/ForegroundEndTop_m.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Marocco/foreground/ForegroundEndBottom_m.png')
	elif local == 2:
		if index == 0:
			background.texture = preload('res://MiniGame01/Background/Textures/Argentina/background/BackgroundStart_a.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Argentina/foreground/ForegroundStartTop_a.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Argentina/foreground/ForegroundStartBottom_a.png')
		elif index == 1:
			background.texture = preload('res://MiniGame01/Background/Textures/Argentina/background/BackgroundMiddle1_a.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Argentina/foreground/ForegroundMiddle1Top_a.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Argentina/foreground/ForegroundMiddle1Bottom_a.png')
		elif index == 2:
			background.texture = preload('res://MiniGame01/Background/Textures/Argentina/background/BackgroundMiddle2_a.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Argentina/foreground/ForegroundMiddle2Top_a.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Argentina/foreground/ForegroundMiddle2Bottom_a.png')
		elif index == 3:
			background.texture = preload('res://MiniGame01/Background/Textures/Argentina/background/BackgroundEnd_a.png')
			foregroundTop.texture = preload('res://MiniGame01/Background/Textures/Argentina/foreground/ForegroundEndTop_a.png')
			foregroundBottom.texture = preload('res://MiniGame01/Background/Textures/Argentina/foreground/ForegroundEndBottom_a.png')