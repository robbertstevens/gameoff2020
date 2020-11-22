extends State


var possible_wander_directions = [Vector2.UP, Vector2.DOWN, Vector2.RIGHT, Vector2.LEFT]
var direction = Vector2.ZERO
var wander_timer = null

var target = Vector2.ZERO
var velocity = Vector2.ZERO

func enter() -> void:	
	randomize()
	direction = possible_wander_directions[randi() % possible_wander_directions.size()]
	target = host.global_position + (direction * 3)
	$Sprite.global_position = target
	print(target)
	.enter()
	
func exit(new_state) -> void:
	.exit(new_state)

func process(delta):
	if host.global_position.distance_to(target) < 1:
		print("to Idle")
		return become_idle()
	
	velocity = host.velocity.move_toward(target * host.MAX_SPEED, host.ACCELERATION * delta)
	host.move_and_slide(velocity)

func become_idle() -> void:
	exit("Idle")
