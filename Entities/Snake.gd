extends KinematicBody2D

onready var navigation: Navigation2D = get_parent()

var target = Vector2(-3, 0) * 16
var path: PoolVector2Array
var velocity = Vector2.ZERO

func _ready():
	pass

func _process(delta):
	$Sprite2.global_position = target
	
	#path = navigation.get_simple_path(global_position, target, false)
	
	if path.size() == 0:
		target = get_new_target()

func _physics_process(delta):
	if path.size() > 0:
		var t = path[0]
		velocity = velocity.move_toward(t.normalized() * 100, 100 * delta)
		
		if global_position.distance_to(t) < 5:
			path.remove(0)
		
		velocity = move_and_slide(velocity)
	
func get_new_target():
	return Vector2(rand_range(0,15), rand_range(0,20))
	
