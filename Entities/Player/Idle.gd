extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter() -> void:
	AnimationState.travel("Idle")
	print("Entered state: ", name)
	
func exit(new_state) -> void:
	.exit(new_state)

func process(delta):
	host.velocity = host.velocity.move_toward(Vector2.ZERO, host.FRICTION * delta)
	host.move_and_slide(host.velocity)

func input(event: InputEvent):
	if event.is_action("ui_right"):
		exit("Move")
	if event.is_action("ui_left"):
		exit("Move")
	if event.is_action("ui_up"):
		exit("Move")
	if event.is_action("ui_down"):
		exit("Move")
