extends Node2D

onready var animPlayer = $AnimationPlayer
onready var animThinkbubble = $thinkbubble/anim_thinkbubble
onready var animPickUps = $animPickups/animPickUps

onready var speedUp = $animPickups/SpeedUp
onready var toolbox = $animPickups/Toolbox

onready var player = get_node("../Player")
onready var pickUps = get_node("../PickUps")

var playerSpeedUp = false
var playerToolbox = false

func _ready():
	animPlayer.play("Idle")

func _process(delta):
	pass


func _on_Area2D_body_entered(body):
	if playerSpeedUp == true || playerToolbox == true:
		animPickUps.play("dropItems")
		player.playerControll = false
	if playerSpeedUp == true:
		playerSpeedUp = false
		speedUp.visible = true
		player.speedUp = false
	if playerToolbox == true:
		playerToolbox = false
		toolbox.visible = true
		player.toolbox = false
		player.sprite.texture = player.spritetexture
		player.barrow_front_normal.visible = false
		player.barrow_front_upgrade.visible = true
		if pickUps.maxItems < 6:
			pickUps.maxItems += 1


func _on_animPickUps_animation_finished(dropItems):
	player.playerControll = true
