extends Area2D

onready var sprite = $Sprite
onready var collisionShape = $CollisionShape2D
onready var player = get_node("../../Player")
var textures = [preload('res://MiniGame01/Textures/PickUps/item_boost.png'), preload('res://MiniGame01/Textures/PickUps/item_toolbox.png')]
var texture_index



func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_PowerUp_body_entered(body):
	sprite.visible = false
	collisionShape.visible = false
	if texture_index == 0:
		player.speedUp = true
	else:
		player.toolbox = true
