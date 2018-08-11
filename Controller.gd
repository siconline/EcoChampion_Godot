extends Node

#Index Level
var index = 0

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
	
func _process(delta):
	if index == 0:
		#load MainMenu
		add_child(mainMenu)
		remove_child(levelMenu)
		mainMenu_Obj = $MainMenu
		index = mainMenu_Obj.index
		if mainMenu_Obj.index == 1:
			mainMenu_Obj.index = 0
	elif index == 1:
		#load LevelMenu
		add_child(levelMenu)
		remove_child(mainMenu)
		levelMenu_Obj = $LevelMenu
		index = levelMenu_Obj.index
		if levelMenu_Obj.index == 0:
			levelMenu_Obj.index = 1