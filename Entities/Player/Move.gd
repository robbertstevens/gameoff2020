extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter() -> void:
	AnimationState.travel("Walk")
	print("Entered state: ", name)
	
func exit(new_state) -> void:
	.exit(new_state)

func process(delta) -> void:
	var axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		exit("Idle")
		return
	
	AnimationTree.set("parameters/Idle/blend_position", axis)
	AnimationTree.set("parameters/Walk/blend_position", axis)
	
	host.velocity = host.velocity.move_toward(axis * host.MAX_SPEED, host.ACCELERATION * delta)
	host.move_and_slide(host.velocity)

func get_input_axis() -> Vector2:
	var axis = Vector2.ZERO
	axis.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	axis.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return axis.normalized()
