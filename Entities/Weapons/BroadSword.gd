extends BaseWeapon

onready var AnimationTree = $AnimationTree
onready var AnimationState = AnimationTree.get("parameters/playback")

func _process(delta) -> void:
	init_aim_directions()
	
	if is_attacking():
		var direction = get_attack_direction()
		
		AnimationTree.set("parameters/Idle/blend_position", direction)
		AnimationTree.set("parameters/Attack/blend_position", direction)
		AnimationState.travel("Attack")
		
		spawn_projectiles(direction)
	else:
		AnimationState.travel("Idle")
