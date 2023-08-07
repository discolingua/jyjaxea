# generic weapon interface to attach to ships
extends Area2D

class_name Weapon

const Bullet = preload("res://Scenes/Bullet.tscn")

const SHOT_SPEED = 100

var velocity : Vector2 = Vector2.ZERO

func _ready():
	print("weapon ready")


func shoot() -> void:
	# print("shot fired")
	var _bulletInstance = Bullet.instance()
	_bulletInstance.position = self.position
	add_child(_bulletInstance)

