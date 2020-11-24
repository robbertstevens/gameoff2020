# Chase State
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

var direction = Vector2.ZERO
var wander_timer = null

var target = Vector2.ZERO
var velocity = Vector2.ZERO

func enter() -> void:
	AnimationState.travel("Walk")
	.enter()
	
func exit(new_state) -> void:
	direction = Vector2.ZERO
	.exit(new_state)

func physics_process(delta):
	var motion = chase_target(Global.player) * host.MAX_SPEED
	
	if motion == Vector2.ZERO:
		become_idle()
	
	host.velocity = host.move_and_slide(motion)
	
func become_idle() -> void:
	exit("Idle")

func chase_target(target) -> Vector2:
	var look     = host.get_node("RayCast2D")
	look.cast_to = (target.position - host.position)
	look.force_raycast_update()
	
	if !look.is_colliding():
		return look.cast_to.normalized()
	else:
		for scent in target.scent_trail:
			look.cast_to = (scent.position - host.position)
			look.force_raycast_update()

			if !look.is_colliding():
				return look.cast_to.normalized()
	
	return Vector2.ZERO
