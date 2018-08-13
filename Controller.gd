extends Node

#clear Controller childs
var clean = true
#Index Level
var index = 0
#Localisation
var local = 0

#Index 0 = Main Menu
onready var path01 = preload("res://Menu/MainMenu.tscn")
var mainMenu
#Index 1 = Level Menu
onready var path02 = preload("res://Menu/LevelMenu.tscn")
var levelMenu
#Index 2 = Localisation Menu
onready var path03 = preload("res://Menu/LocalMenu.tscn")
var localMenu
#Index 3 = MiniGame01 Background
onready var path04 = preload("res://MiniGame01/MiniGame01.tscn")
var miniGame01
#Index 4 = Pause Menu
var path05 = preload("res://Menu/PauseMenu.tscn")
var pauseMenu

func _ready():
	mainMenu = path01.instance()
	levelMenu = path02.instance()
	localMenu = path03.instance()
	miniGame01 = path04.instance()
	pauseMenu = path05.instance()
	
func _process(delta):
	if index == 0 && clean == true:
		#load MainMenu
		_loadMenu(mainMenu, pauseMenu, levelMenu)
		_closeMiniGame01(miniGame01)
	elif index == 1 && clean == true:
		#load LevelMenu
		_loadMenu(levelMenu, mainMenu, localMenu)
	elif index == 2 && clean == true:
		#load LocalMenu
		_loadMenu(localMenu, levelMenu, levelMenu)
	elif index == 3 && clean == true:
		#load MiniGame01 Background
		miniGame01.local = local
		_loadMiniGame01(miniGame01, localMenu)
	elif index == 4 && clean == true:
		#load LocalMenu
		_loadMenu(pauseMenu, levelMenu, levelMenu)


func _loadMenu(menu_load, menu_remove1, menu_remove2):
	remove_child(menu_remove1)
	remove_child(menu_remove2)
	add_child(menu_load)
	clean = false

func _loadMiniGame01(game_load, remove_Obj):
	remove_child(remove_Obj)
	add_child(game_load)
	clean = false
func _closeMiniGame01(game_remove):
	remove_child(game_remove)