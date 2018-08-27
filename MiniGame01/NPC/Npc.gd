extends Node2D

onready var animPlayer = $AnimationPlayer

func _ready():
	animPlayer.play("Idle")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
