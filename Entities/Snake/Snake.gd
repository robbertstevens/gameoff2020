extends KinematicBody2D

onready var stats = $Stats

var MAX_SPEED = 40
var ACCELERATION = 150

var velocity = Vector2.ZERO
var direction = Vector2.ZERO
var target = Vector2.ZERO

func _on_Hurtbox_area_entered(area):
	stats.health -= area.base_damage
	$StateMachine.change_to("Hurt")
