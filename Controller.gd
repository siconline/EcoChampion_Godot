extends Node

#clear Controller childs
var clean = true
#Index Level
var index = 0
#Localisation
var local = 0

#Index 0 = Main Menu
var path01 = "res://Menu/MainMenu.tscn"
var scene_resource01 = load(path01)
var mainMenu = scene_resource01.instance()
onready var mainMenu_Obj
#Index 1 = Level Menu
var path02 = "res://Menu/LevelMenu.tscn"
var scene_resource02 = load(path02)
var levelMenu = scene_resource02.instance()
onready var levelMenu_Obj
#Index 2 = Localisation Menu
var path03 = "res://Menu/LocalMenu.tscn"
var scene_resource03 = load(path03)
var localMenu = scene_resource03.instance()
onready var localMenu_Obj
#Index 3 = MiniGame01 Background
var path04 = "res://MiniGame01/MiniGame01.tscn"
var scene_resource04 = load(path04)
var miniGame01 = scene_resource04.instance()
onready var miniGame01_Obj
	
func _process(delta):
	if index == 0 && clean == true:
		#load MainMenu
		_loadMenu(mainMenu, levelMenu, levelMenu)
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


func _loadMenu(menu_load, menu_remove1, menu_remove2):
	remove_child(menu_remove1)
	remove_child(menu_remove2)
	add_child(menu_load)
	clean = false

func _loadMiniGame01(game_load, remove_Obj):
	remove_child(remove_Obj)
	add_child(game_load)
	clean = false