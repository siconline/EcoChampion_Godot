extends Node2D

onready var background_Start = $Background_Start
onready var background_Middle1 = $Background_Middle1
onready var background_Middle2 = $Background_Middle2
onready var background_End = $Background_End
onready var foreground_Start_Top = $Foreground_Start_Top
onready var foreground_Start_Bottom = $Foreground_Start_Bottom
onready var foreground_Middle1_Top = $Foreground_Middle1_Top
onready var foreground_Middle1_Bottom = $Foreground_Middle1_Bottom
onready var foreground_Middle2_Top = $Foreground_Middle2_Top
onready var foreground_Middle2_Bottom = $Foreground_Middle2_Bottom
onready var foreground_End_Top = $Foreground_End_Top
onready var foreground_End_Bottom = $Foreground_End_Bottom

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	pass
	
# set Backgrounds and Foregrund for Germany
func loadGermany():
	background_Start.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/BackgroundStart_d.png')
	background_Middle1.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/BackgroundMiddle1_d.png')
	background_Middle2.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/BackgroundMiddle2_d.png')
	background_End.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/BackgroundEnd_d.png')
