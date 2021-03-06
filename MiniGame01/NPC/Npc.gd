extends Node2D

onready var animPlayer = $AnimationPlayer
onready var animThinkbubble = $thinkbubble/anim_thinkbubble
onready var animPickUps = $animPickups/animPickUps

onready var speedUp = $animPickups/SpeedUp
onready var toolbox = $animPickups/Toolbox

onready var player = get_node("../Player")
onready var hud = get_node("../Player/Node2D/Hud")
onready var pickUps = get_node("../PickUps")

onready var powerups = get_node("../PowerUps")

var playerSpeedUp = false
var playerToolbox = false
var check = false

func _ready():
	animPlayer.play("Idle")

func _process(delta):
	pass


func _on_Area2D_body_entered(body):
	if playerSpeedUp == true || playerToolbox == true:
		animPickUps.play("dropItems")
		check = true
		player.playerControll = false
		$Sprite.visible = false
		$winNPC.visible = true
		$thinkbubble.visible = false
		$winNPC_timer.start()
		
	if playerSpeedUp == true:
		playerSpeedUp = false
		speedUp.visible = true
		player.speedUp = false
		if powerups.counterSUP < 7:
			powerups.counterSUP += 1
			hud.boostCounter = 4
	if playerToolbox == true:
		playerToolbox = false
		toolbox.visible = true
		player.toolbox = false
		player.sprite.texture = player.spritetexture
		player.barrow_front_normal.visible = false
		player.barrow_front_upgrade.visible = true
		if pickUps.maxItems < 6:
			pickUps.maxItems += 1
			powerups.counterTOL += 2


func _on_animPickUps_animation_finished(dropItems):
	if check == true:
		player.playerControll = true
		check = false


func _on_winNPC_timer_timeout():
	$Sprite.visible = true
	$winNPC.visible = false
	$thinkbubble.visible = true
