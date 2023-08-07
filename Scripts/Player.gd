# Player.gd
extends Mob

class_name Player

enum STATES {IDLE, MOVING, SHOOTING}

const MAX_SPEED = 100

var velocity : Vector2 = Vector2.ZERO
var lastVelocity : Vector2 = Vector2.ZERO

var state : int = STATES.IDLE

func _ready() -> void:
	print(getHealth())

func _physics_process(delta) -> void:
	match state:
		STATES.IDLE: idleState(delta)
		STATES.MOVING: movingState(delta)



func idleState(delta) -> void:
	var _i = readMovement()
	readButtons()
	if _i != Vector2.ZERO:
		state = STATES.MOVING
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta)


func movingState(delta) -> void:
	var _i = readMovement()
	readButtons()
	if _i != Vector2.ZERO:
		lastVelocity = _i
		velocity = move_and_slide(_i * MAX_SPEED)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta)


func readButtons() -> void:
	if Input.is_action_just_pressed("ui_accept"):
		for child in get_children():
			if child.has_method("shoot"):
				child.shoot()



func readMovement() -> Vector2:
	var _i = Vector2.ZERO

	_i.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	_i.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	# normalize vector fixes fast/distorted diagonals
	_i = _i.normalized()
	return _i
