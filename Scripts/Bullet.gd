extends Area2D

class_name Bullet

const SPEED = 10

var velocity : Vector2 = Vector2(0,SPEED * -1)

func _ready():
	print("bullet ready")

func _physics_process(_delta) -> void:
	position += velocity

func _on_Bullet_body_entered(_body:RedShip) -> void:
	print("hit from bullet")
	_body.queue_free()
	queue_free()


# despawn bullet when it's gone offscreen
func _on_BulletLifeTimer_timeout():
	print("click")
	if ( position.y < 0 ):
		queue_free()
