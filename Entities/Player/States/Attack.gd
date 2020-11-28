# Player Attack State
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter():
	AnimationState.travel("Attack")

func attack_finished():
	back()
