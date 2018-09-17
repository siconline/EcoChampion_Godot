extends Control

var available_Menu = true

onready var camera = $Camera2D
onready var button_LevelMenu = $Button_LevelMenu
onready var button_Score = $Button_Score
onready var button_QuitGame = $Button_QuitGame
onready var button_GarbagePatrol = $Button_GarbagePatrol
onready var button_Germany = $Button_Germany
onready var button_Morocco = $Button_Morocco
onready var button_Argentina = $Button_Argentina
onready var textureButton_BackMM = $TextureButton_BackMainMenu
onready var textureButton_BackLM = $TextureButton_BackLevelMenu
onready var background = $Background
onready var middleground = $Middleground
onready var foreground = $Foreground
onready var saveScore = get_node("../MiniGame01/Player/Node2D/Hud/Score/saveScore")


func _ready():
	get_tree().set_pause(false)
	_loadMainMenu()
	
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_LevelMenu_pressed():
	_loadLevelMenu()
	playSoundPressButton()


func _on_Button_Score_pressed():
	_loadScoreMenu()
	playSoundPressButton()


func _on_Button_QuitGame_pressed():
	# Exit Game / Close Application
	get_tree().quit()
	playSoundPressButton()


func _on_Button_GarbagePatrol_pressed():
	_loadGarbagePatrol()
	playSoundPressButton()


func _on_TextureButton_BackMainMenu_pressed():
	_loadMainMenu()
	playSoundPressButton()


func _on_TextureButton_BackLevelMenu_pressed():
	_loadLevelMenu()
	playSoundPressButton()

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
	button_Morocco.visible = true
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
	button_Morocco.visible = false
	button_Argentina.visible = false
	
	textureButton_BackMM.visible = true
	textureButton_BackLM.visible = false

func _loadScoreMenu():
	$Button_LevelMenu.visible = false
	$Button_Score.visible = false
	$Button_QuitGame.visible = false
	$Middleground.visible = false
	$currentScoreList/ScoreList.modulate = "000000"
	$currentScoreList.visible = true
	$TextureButton_BackMainMenu.visible = true
	saveScore.load_bestscore()
	


func _loadMainMenu():
	background.texture = preload('res://Menu/Textures/Background/game_menu_bg.png')
	middleground.texture = preload('res://Menu/Textures/Background/T_GameMenu_MG.png')
	foreground.texture = preload('res://Menu/Textures/Background/game_menu_fg.png')
	
	button_LevelMenu.visible = true
	button_Score.visible = true
	button_QuitGame.visible = true
	button_GarbagePatrol.visible = false
	button_Germany.visible = false
	button_Morocco.visible = false
	button_Argentina.visible = false
	
	textureButton_BackMM.visible = false
	textureButton_BackLM.visible = false
	
	$currentScoreList.visible = false
	$Middleground.visible = true



#---SOUNDS----------------------------------#
func _on_Button_LevelMenu_mouse_entered():
	playSoundHoverButton()
func _on_Button_GarbagePatrol_mouse_entered():
	playSoundHoverButton()
func _on_Button_Score_mouse_entered():
	playSoundHoverButton()
func _on_Button_QuitGame_mouse_entered():
	playSoundHoverButton()
func _on_Button_Germany_mouse_entered():
	playSoundHoverButton()
func _on_Button_Morocco_mouse_entered():
	playSoundHoverButton()
func _on_Button_Argentina_mouse_entered():
	playSoundHoverButton()
func _on_TextureButton_BackMainMenu_mouse_entered():
	playSoundHoverButton()
func _on_TextureButton_BackLevelMenu_mouse_entered():
	playSoundHoverButton()
func playSoundHoverButton():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_hover.wav")
	player.play()
func playSoundPressButton():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_click.wav")
	player.play()