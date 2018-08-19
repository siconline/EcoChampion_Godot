extends Node2D

var localisation = 0
onready var grounds = $Grounds

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

# check localisation index of countries an load Theme
func _process(delta):
	if localisation == 0:
		grounds.loadGermany()
