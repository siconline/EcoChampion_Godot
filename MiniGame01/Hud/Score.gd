extends Control

onready var hud_pauseButton = get_node("../../Hud/Button_Pause")
onready var clock = get_node("../../Hud/Clock")
onready var scoreHud = get_node("../../Hud/Score_Count")
onready var animPlayer = $AnimationPlayer
onready var currentHighScore = $Background/currentHighScore
onready var currentScoreList = $Background/currentScoreList
onready var mainMenuButton = $Background/MainMenuButton
onready var scoreLabel = $Background/currentHighScore/Score

var scrollDown = true
var scrollUp = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	
	if clock.timeout == true:
		if scrollDown == true:
			scoreLabel.text = scoreHud.text
			currentHighScore.visible = true
			animPlayer.play("scroll_Score_down")
			get_tree().set_pause(true)
			hud_pauseButton.visible = false
			scrollDown = false


func _on_TextureButton_pressed():
	animPlayer.play("scroll_Score_up")
	scrollUp = true
	$saveScore._on_LineEdit_text_entered($Background/currentHighScore/namen_papier/LineEdit.text)


func _on_AnimationPlayer_animation_finished(scroll_Score_up):
	if scrollUp == true:
		currentHighScore.visible = false
		currentScoreList.visible = true
		mainMenuButton.visible = true
		animPlayer.play("scroll_Score_down")
		scrollUp = false


func _on_MainMenuButton_pressed():
	get_tree().reload_current_scene()
