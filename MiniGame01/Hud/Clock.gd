extends Node2D

onready var clockMinute = $Clock_Minute
onready var clockSecond = $Clock_Second

var minute = 0
var second = 20

var timeout = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	
	if minute == 0 && second == 0:
		timeout = true
	
	if second < 0:
		second = 59
		minute -= 1
	
	
	clockMinute.text = str(minute)
	if second < 10:
		clockSecond.text = str(0, second)
	else:
		clockSecond.text = str(second)


func _on_Clock_Timer_timeout():
	if timeout == false:
		second -= 1
	
