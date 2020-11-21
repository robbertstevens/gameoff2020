extends State


var possible_wander_directions = [Vector2.UP, Vector2.DOWN, Vector2.RIGHT, Vector2.LEFT]
var direction = Vector2.ZERO
var wander_timer = null
func enter() -> void:	
	wander_timer = Timer.new()
	wander_timer.connect("timeout", self, "become_idle")
	wander_timer.set_wait_time(1)
	add_child(wander_timer)
	wander_timer.start()
	.enter()
	
func exit(new_state) -> void:
	direction = Vector2.ZERO
	.exit(new_state)

func process(delta):
	if direction == Vector2.ZERO:
		direction = possible_wander_directions[randi() % possible_wander_directions.size()]
		
	host.velocity = host.velocity.move_toward(direction * host.MAX_SPEED, host.ACCELERATION * delta)
	host.move_and_slide(host.velocity)

func become_idle() -> void:
	wander_timer.queue_free()
	exit("Idle")
