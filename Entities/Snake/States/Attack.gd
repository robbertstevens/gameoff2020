# Attack State Snake
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter():
	AnimationState.travel("Attack")
	

func _attack_finished():
	exit("Idle")
	
