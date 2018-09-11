extends Node2D

onready var animPlayer = $AnimationPlayer
onready var animThinkbubble = $thinkbubble/anim_thinkbubble
onready var animPickUps = $animPickups/animPickUps

onready var speedUp = $animPickups/SpeedUp
onready var toolbox = $animPickups/Toolbox

var playerSpeedUp = false
var playerToolbox = false

func _ready():
	animPlayer.play("Idle")

func _process(delta):
	pass


func _on_CollisionShape2D_tree_entered():
	if playerSpeedUp == true:
		speedUp.visible = true
	if playerToolbox == true:
		toolbox.visible = true
	#animPickUps.play("dropItems")
