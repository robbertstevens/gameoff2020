extends Node2D

export var max_health = 100
export var damage = 1

onready var health = max_health setget _set_health

signal health_changed(new_value)

func _set_health(value):
	health = value
	emit_signal("health_changed", health)
