extends State

const gold_scene = preload("res://Entities/Gold.tscn")

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

func enter() -> void:
	print("enter??")
	randomize()
	AnimationState.travel("Dead")
	yield(get_tree().create_timer(0.5), "timeout")
	drop_gold()

func exit(next_state):
	print("exit??")
	.exit(next_state)

func drop_gold():
	for _i in range(0, 10):
		var gold = gold_scene.instance()
		gold.global_position = host.global_position
		gold.linear_velocity = Vector2(rand_range(-10, 10), rand_range(-10, 10))
		
		Global.add_entity_to_world(gold)
