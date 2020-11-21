# Snake Idle State
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")
var wander_timer = null
func enter() -> void:
	AnimationState.travel("Idle")
	
	wander_timer = Timer.new()
	wander_timer.set_wait_time(1)
	wander_timer.connect("timeout", self, "go_wander")
	add_child(wander_timer)
	wander_timer.start()
	.enter()
	
func exit(new_state) -> void:
	.exit(new_state)

func process(delta):
	pass
	
func go_wander() -> void:
	wander_timer.queue_free()
	exit("Wandering")
