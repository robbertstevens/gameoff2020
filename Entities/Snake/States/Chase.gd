# Chase State
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter() -> void:
	AnimationState.travel("Walk")

func physics_process(_delta):
	var motion = host.target.normalized() * host.MAX_SPEED
	
	AnimationTree.set("parameters/Idle/blend_position", motion)
	AnimationTree.set("parameters/Walk/blend_position", motion)
	AnimationTree.set("parameters/Attack/blend_position", motion)
	
	host.velocity = host.move_and_slide(motion)
	
	exit("Idle")
