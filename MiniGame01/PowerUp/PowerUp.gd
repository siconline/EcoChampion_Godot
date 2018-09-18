extends Area2D

onready var sprite = $Sprite
onready var collisionShape = $CollisionShape2D
onready var player = get_node("../../Player")
var textures = [preload('res://MiniGame01/Textures/PickUps/item_boost.png'), preload('res://MiniGame01/Textures/PickUps/item_toolbox.png')]
var texture_index


func _ready():
	visible = false
	collisionShape.disabled = true

func _process(delta):
	pass


func _on_PowerUp_body_entered(body):
	playSoundPowerUpCollect()
	#sprite.visible = false
	position.y = 1500
	#queue_free()
	if texture_index == 0:
		player.speedUp = true
	else:
		player.toolbox = true

#SOUNDS--------------------------#
func playSoundPowerUpCollect():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Sounds/S_blob.wav")
	player.play()