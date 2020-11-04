extends KinematicBody2D

onready var ray = $RayCast2D


var direction = Vector2()
var speed = 0

var charging = true
var charge_power = 0
var max_power = 10

func _process(delta):
	speed -= delta
	
	speed = max(speed, 0)
	
	if speed > 0:
		charging = false
	else:
		charging = true

func _physics_process(delta):
	var collider = move_and_collide(direction * speed * delta)
	
	if collider:
		direction = direction.bounce(collider.normal)
	
		
func _input(event):
	if event.is_action("ui_accept") and charging:
		charge_power += 1
		charge_power = min(charge_power, max_power)
		
		print(charge_power)
		
	if event.is_action_released("ui_accept"):
		speed = charge_power
		direction = Vector2.RIGHT * speed
		charge_power = 0
		print(speed)
		print(direction)
