extends State

onready var AnimationTree = $"../../AnimationTree"
onready var AnimationState = AnimationTree.get("parameters/playback")

var attack_cooldown = 0.5

func enter():
	attack_cooldown = 0.5
	AnimationState.travel("PrepareAttack")
	
func process(delta):
	attack_cooldown -= delta
	
	if attack_cooldown <= 0:
		exit("Attack")

func _on_AttackRange_body_exited(body):
	exit("Idle")
