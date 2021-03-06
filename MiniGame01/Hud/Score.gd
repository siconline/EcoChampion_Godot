extends Control

onready var hud_pauseButton = get_node("../../Hud/Button_Pause")
onready var hud_boost = get_node("../../Hud/boost")
onready var clock = get_node("../../Hud/Clock")
onready var scoreHud = get_node("../../Hud/Score_Count")
onready var hud_score_count = get_node("../../Hud/Score_Count")
onready var hud_score_texture = get_node("../../Hud/Score_Texture")
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
			hud_boost.visible = false
			clock.visible = false
			hud_score_count.visible = false
			hud_score_texture.visible = false
			scrollDown = false


func _on_TextureButton_pressed():
	playSoundPressButton()
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
	playSoundPressButton()
	get_tree().reload_current_scene()


#---SOUNDS----------------------------------#
func _on_TextureButton_mouse_entered():
	playSoundHoverButton()
func _on_MainMenuButton_mouse_entered():
	playSoundHoverButton()
func playSoundHoverButton():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_hover.wav")
	player.play()
func playSoundPressButton():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_click.wav")
	player.play()