# Snake Idle State
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter() -> void:
	AnimationState.travel("Idle")
	
	.enter()
	
func exit(new_state) -> void:
	.exit(new_state)

func process(delta):
	exit("Chase")
