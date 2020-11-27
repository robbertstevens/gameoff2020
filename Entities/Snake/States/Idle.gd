# Snake Idle State
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter() -> void:
	pass

func process(delta):
	host.target = find_target(Global.player)
	
	if host.target != Vector2.ZERO:
		exit("Chase")
		return
		
	AnimationState.travel("Idle")

func find_target(target) -> Vector2:
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
