extends Node

#Controller
var controller = "res://Controller.tscn"

func _ready():
	# load Controller
	get_tree().change_scene(controller)

func _process(delta):
	pass