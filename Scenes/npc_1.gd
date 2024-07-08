extends Node2D

var dialogo = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Parado")
	$Area2D2.rotation_degrees = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

