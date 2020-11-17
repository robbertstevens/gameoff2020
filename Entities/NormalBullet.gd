extends KinematicBody2D

export var SPEED = 100;

var direction: Vector2;
var owner_velocity: Vector2 = Vector2.ZERO

func _ready():
	$Timer.connect("timeout", self, "queue_free")
	
	$Timer.start()

func _physics_process(delta) -> void:
	var motion = direction * SPEED
	var collider = move_and_collide(motion * delta)
	
	apply_collision(collider)
	
func apply_collision(collider) -> void:
	pass
