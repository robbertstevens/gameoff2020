# Player Move State
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

var velocity = Vector2.ZERO

func enter() -> void:
	AnimationState.travel("Walk")
	.enter()
	
func exit(new_state) -> void:
	velocity = Vector2.ZERO
	.exit(new_state)

func process(delta) -> void:
	var axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		exit("Idle")
		return
	
	AnimationTree.set("parameters/Idle/blend_position", axis)
	AnimationTree.set("parameters/Walk/blend_position", axis)
	AnimationTree.set("parameters/Attack/blend_position", axis)
	
	velocity = velocity.move_toward(axis * host.MAX_SPEED, host.ACCELERATION * delta)
	host.move_and_collide(velocity)

func get_input_axis() -> Vector2:
	var axis = Vector2.ZERO
	axis.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	axis.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return axis.normalized()

func input(event):
	if (event.is_action_pressed("ui_action_one")):
		exit("Attack")
