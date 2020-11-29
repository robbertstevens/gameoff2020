# Snake Idle State
extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func process(_delta):
	host.target = find_target(Global.player)
	
	if host.target == Vector2.ZERO:
		AnimationState.travel("Idle")
		return
	
	exit("Chase")

func find_target(obj) -> Vector2:
	var look     = host.get_node("RayCast2D")
	look.cast_to = (obj.position - host.position)
	look.force_raycast_update()
	
	if !look.is_colliding():
		return look.cast_to.normalized()
	else:
		for scent in obj.scent_trail:
			look.cast_to = (scent.position - host.position)
			look.force_raycast_update()

			if !look.is_colliding():
				return look.cast_to.normalized()

	return Vector2.ZERO


func _on_AttackRange_body_entered(_body):
	exit("PrepareAttack")
