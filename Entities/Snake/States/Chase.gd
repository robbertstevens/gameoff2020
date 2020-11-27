# Chase State
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter() -> void:
	AnimationState.travel("Walk")
	
func exit(new_state) -> void:
	.exit(new_state)

func physics_process(delta):
	var motion = host.target * host.MAX_SPEED
	
	host.velocity = host.move_and_slide(motion)
	
	exit("Idle")
