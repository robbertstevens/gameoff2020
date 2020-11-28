extends KinematicBody2D

onready var stats = $Stats

export var ATTACK_RANGE = 10

var MAX_SPEED = 40
var ACCELERATION = 150

var velocity = Vector2.ZERO
var direction = Vector2.ZERO
var target = Vector2.ZERO

func _on_Hurtbox_area_entered(area):
	stats.health -= area.base_damage
	if $StateMachine.current_state.name != "Hurt":
		$StateMachine.change_to("Hurt")
