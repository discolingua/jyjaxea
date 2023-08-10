extends Area2D

class_name Bullet

const SPEED = 10

var velocity : Vector2 = Vector2(0,SPEED * -1)

func _ready():
	print("bullet ready")

func _physics_process(_delta) -> void:
	position += velocity


# despawn bullet when it's gone offscreen
func _on_BulletLifeTimer_timeout():
	print("click")
	if ( position.y < 0 ):
		queue_free()
