# Dead State Player
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter():
	AnimationState.travel("Dead")
	
	yield(get_tree().create_timer(.5), "timeout")
	
	Global.pause()
