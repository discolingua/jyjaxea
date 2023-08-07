extends Area2D

class_name Bullet

const SPEED = 50

var velocity : Vector2 = Vector2(0,SPEED * -1)

func _ready():
	print("bullet ready")

func _physics_process(_delta) -> void:
	pass
