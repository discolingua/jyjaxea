# basic red ship enemy
extends Mob

class_name RedShip

var moveSpeed : int = 100
export (NodePath) var patrolPath
var patrolPoints
var patrolIndex : int = 0
var velocity : Vector2 = Vector2.ZERO


func _ready():
	patrolPath = "/root/GameWorld/Path2D"
	if patrolPath:
		patrolPoints = get_node(patrolPath).curve.get_baked_points()

func _on_RedShip_input_event():
	print("hit")

func _physics_process(_delta):
	if !patrolPath:
		return
	var target = patrolPoints[patrolIndex]
	if position.distance_to(target) < 1:
		patrolIndex = wrapi(patrolIndex + 1, 0, patrolPoints.size())
		target = patrolPoints[patrolIndex]
	velocity = (target - position).normalized() * moveSpeed
	velocity = move_and_slide(velocity)
