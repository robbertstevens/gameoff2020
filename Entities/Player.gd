extends KinematicBody2D

const MAX_SPEED: int = 80;
const ACCELERATION: int = 500
const FRICTION: int = 500;

var velocity: Vector2 = Vector2.ZERO;

func _physics_process(delta) -> void:
	var axis = get_input_axis()
	
	if axis != Vector2.ZERO:
		velocity = velocity.move_toward(axis * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
	

func get_input_axis() -> Vector2:
	var axis = Vector2.ZERO
	axis.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	axis.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return axis.normalized()
