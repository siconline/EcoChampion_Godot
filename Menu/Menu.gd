extends Control

var available_Menu = true

onready var camera = $Camera2D
onready var button_LevelMenu = $Button_LevelMenu
onready var button_Score = $Button_Score
onready var button_QuitGame = $Button_QuitGame
onready var button_GarbagePatrol = $Button_GarbagePatrol
onready var button_Germany = $Button_Germany
onready var button_Marocco = $Button_Marocco
onready var button_Argentina = $Button_Argentina
onready var textureButton_BackMM = $TextureButton_BackMainMenu
onready var textureButton_BackLM = $TextureButton_BackLevelMenu
onready var background = $Background
onready var middleground = $Middleground
onready var foreground = $Foreground


func _ready():
	_loadMainMenu()
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_LevelMenu_pressed():
	_loadLevelMenu()


func _on_Button_Score_pressed():
	pass # replace with function body


func _on_Button_QuitGame_pressed():
	# Exit Game / Close Application
	get_tree().quit()


func _on_Button_GarbagePatrol_pressed():
	_loadGarbagePatrol()


func _on_TextureButton_BackMainMenu_pressed():
	_loadMainMenu()


func _on_TextureButton_BackLevelMenu_pressed():
	_loadLevelMenu()

#----------Own Methods-------------#
func _loadGarbagePatrol():
	background.texture = preload('res://Menu/Textures/Background/game_menu_bg.png')
	middleground.texture = preload('res://Menu/Textures/Background/T_map_mg.png')
	foreground.texture = preload('res://Menu/Textures/Background/game_menu_fg.png')
	
	button_LevelMenu.visible = false
	button_Score.visible = false
	button_QuitGame.visible = false
	button_GarbagePatrol.visible = false
	button_Germany.visible = true
	button_Marocco.visible = true
	button_Argentina.visible = true
	
	textureButton_BackMM.visible = false
	textureButton_BackLM.visible = true

func _loadLevelMenu():
	background.texture = preload('res://Menu/Textures/Background/game_menu_bg.png')
	middleground.texture = preload('res://Menu/Textures/Background/T_map_mg.png')
	foreground.texture = preload('res://Menu/Textures/Background/game_menu_fg.png')
	
	button_LevelMenu.visible = false
	button_Score.visible = false
	button_QuitGame.visible = false
	button_GarbagePatrol.visible = true
	button_Germany.visible = false
	button_Marocco.visible = false
	button_Argentina.visible = false
	
	textureButton_BackMM.visible = true
	textureButton_BackLM.visible = false

func _loadMainMenu():
	background.texture = preload('res://Menu/Textures/Background/game_menu_bg.png')
	middleground.texture = preload('res://Menu/Textures/Background/T_GameMenu_MG.png')
	foreground.texture = preload('res://Menu/Textures/Background/game_menu_fg.png')
	
	button_LevelMenu.visible = true
	button_Score.visible = true
	button_QuitGame.visible = true
	button_GarbagePatrol.visible = false
	button_Germany.visible = false
	button_Marocco.visible = false
	button_Argentina.visible = false
	
	textureButton_BackMM.visible = false
	textureButton_BackLM.visible = false



