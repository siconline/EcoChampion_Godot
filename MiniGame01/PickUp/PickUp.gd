extends Area2D

onready var collisionShape = $CollisionShape2D
onready var sprite = $Sprite
onready var flower = $Flower
onready var flower2 = $Flower2
onready var animPlayer = $AnimationPlayer
onready var particles = $Particles2D

var textures = [preload('res://MiniGame01/Textures/Flowers/verwelkt.png'), preload('res://MiniGame01/Textures/Flowers/blume1.png'), preload('res://MiniGame01/Textures/Flowers/blume2.png'), preload('res://MiniGame01/Textures/Flowers/blume3.png')]
var textureSwitch = false

func _ready():
	randomize()
	flower.texture = textures[0]

func _process(delta):
	if sprite.visible == false && textureSwitch == false:
		flower2.texture = textures[randi()%3+1]
		animPlayer.play("grow")
		textureSwitch = true
#START BUTTERFLYS AFTER GROW ANIMATION IS READY#
func _on_AnimationPlayer_animation_finished(grow):
	particles.emitting = true
