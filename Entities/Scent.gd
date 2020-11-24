extends Node2D

var remove_timer: Timer = null
var parent = null

func _ready():
	assert($Timers.has_node("RemoveTimer"))
	
	remove_timer = $Timers.get_node("RemoveTimer")
	remove_timer.connect("timeout", self, "remove_scent")

func remove_scent() -> void:
	parent.scent_trail.erase(self)
	queue_free()
