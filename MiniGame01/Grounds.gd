extends Node2D

onready var background_Start = $Background_Start
onready var background_Middle1 = $Background_Middle1
onready var background_Middle2 = $Background_Middle2
onready var background_Middle3 = $Background_Middle3
onready var background_End = $Background_End
onready var foreground_Start_Top = $Foreground_Start_Top
onready var foreground_Start_Bottom = $Foreground_Start_Bottom
onready var foreground_Middle1_Top = $Foreground_Middle1_Top
onready var foreground_Middle1_Bottom = $Foreground_Middle1_Bottom
onready var foreground_Middle2_Top = $Foreground_Middle2_Top
onready var foreground_Middle2_Bottom = $Foreground_Middle2_Bottom
onready var foreground_Middle3_Top = $Foreground_Middle3_Top
onready var foreground_Middle3_Bottom = $Foreground_Middle3_Bottom
onready var foreground_End_Top = $Foreground_End_Top
onready var foreground_End_Bottom = $Foreground_End_Bottom

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	pass
	
# set Backgrounds and Foregrunds for Germany
func loadGermany():
	background_Start.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/BackgroundStart_d.png')
	background_Middle1.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/BackgroundMiddle1_d.png')
	background_Middle2.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/BackgroundMiddle2_d.png')
	background_Middle3.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/BackgroundMiddle1_d.png')
	background_End.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/BackgroundEnd_d.png')
	foreground_Start_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/ForegroundStartTop_d.png')
	foreground_Start_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/ForegroundStartBottom_d.png')
	foreground_Middle1_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/ForegroundMiddle1Top_d.png')
	foreground_Middle1_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/ForegroundMiddle1Bottom_d.png')
	foreground_Middle2_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/ForegroundMiddle2Top_d.png')
	foreground_Middle2_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/ForegroundMiddle2Bottom_d.png')
	foreground_Middle3_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/ForegroundMiddle1Top_d.png')
	foreground_Middle3_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/ForegroundMiddle1Bottom_d.png')
	foreground_End_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/ForegroundEndTop_d.png')
	foreground_End_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Germany/ForegroundEndBottom_d.png')

# set Backgrounds and Foregrunds for Morocco
func loadMorocco():
	background_Start.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/BackgroundStart_m.png')
	background_Middle1.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/BackgroundMiddle1_m.png')
	background_Middle2.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/BackgroundMiddle2_m.png')
	background_Middle3.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/BackgroundMiddle1_m.png')
	background_End.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/BackgroundEnd_m.png')
	foreground_Start_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/ForegroundStartTop_m.png')
	foreground_Start_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/ForegroundStartBottom_m.png')
	foreground_Middle1_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/ForegroundMiddle1Top_m.png')
	foreground_Middle1_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/ForegroundMiddle1Bottom_m.png')
	foreground_Middle2_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/ForegroundMiddle2Top_m.png')
	foreground_Middle2_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/ForegroundMiddle2Bottom_m.png')
	foreground_Middle3_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/ForegroundMiddle1Top_m.png')
	foreground_Middle3_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/ForegroundMiddle1Bottom_m.png')
	foreground_End_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/ForegroundEndTop_m.png')
	foreground_End_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Morocco/ForegroundEndBottom_m.png')

# set Backgrounds and Foregrunds for Argentina
func loadArgentina():
	background_Start.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/BackgroundStart_a.png')
	background_Middle1.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/BackgroundMiddle1_a.png')
	background_Middle2.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/BackgroundMiddle2_a.png')
	background_Middle3.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/BackgroundMiddle1_a.png')
	background_End.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/BackgroundEnd_a.png')
	foreground_Start_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/ForegroundStartTop_a.png')
	foreground_Start_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/ForegroundStartBottom_a.png')
	foreground_Middle1_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/ForegroundMiddle1Top_a.png')
	foreground_Middle1_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/ForegroundMiddle1Bottom_a.png')
	foreground_Middle2_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/ForegroundMiddle2Top_a.png')
	foreground_Middle2_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/ForegroundMiddle2Bottom_a.png')
	foreground_Middle3_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/ForegroundMiddle1Top_a.png')
	foreground_Middle3_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/ForegroundMiddle1Bottom_a.png')
	foreground_End_Top.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/ForegroundEndTop_a.png')
	foreground_End_Bottom.texture = preload('res://MiniGame01/Textures/Backgrounds/Argentina/ForegroundEndBottom_a.png')