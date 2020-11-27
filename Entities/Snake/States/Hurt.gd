extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter() -> void:
	AnimationState.travel("Hit")

func _hurt_animation_finished():
	back()

func _on_Stats_health_changed(value) -> void:
	if value <= 0:
		exit("Dead")
