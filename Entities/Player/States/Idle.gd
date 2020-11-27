# Player Idle State
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

var velocity = Vector2.ZERO
func enter() -> void:
	AnimationState.travel("Idle")
	.enter()
	
func exit(new_state) -> void:
	.exit(new_state)

func process(delta):
	velocity = velocity.move_toward(Vector2.ZERO, host.FRICTION * delta)
	host.move_and_slide(velocity)

func input(event: InputEvent):
	if event.is_action("ui_right"):
		exit("Move")
	if event.is_action("ui_left"):
		exit("Move")
	if event.is_action("ui_up"):
		exit("Move")
	if event.is_action("ui_down"):
		exit("Move")
	if event.is_action_pressed("ui_action_one"):
		exit("Attack")
